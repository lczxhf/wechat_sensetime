class Api::V1::ApplicationController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_action :verify_authenticity_token

	class InvalidSizeError < RailsParam::Param::InvalidParameterError; end
	class InvalidTypeError < RailsParam::Param::InvalidParameterError; end
	class InvalidCheckTypeError < StandardError; end


	rescue_from(RailsParam::Param::InvalidParameterError) do |err|
	    #TODO
	    render plain: I18n.t("returnCode.code_10001")
	end


	rescue_from(InvalidSizeError) do |err|
	    render plain:  I18n.t("returnCode.code_10003")
	end

	rescue_from(InvalidTypeError) do |err|
	    render plain: I18n.t("returnCode.code_10004")
	end

	def api_error(opt={})
	    #TODO
	    render plain: 'error!'
	end
	
	def current_user
	end

	def check_file(name,opt={})
	    if params[name.to_sym]
		opt.each do |k,v|
			send("check_"+k.to_s,params[name.to_sym],v) if respond_to?("check_"+k.to_s)
		end
	    else
	    	raise RailsParam::Param::InvalidParameterError if opt[:required] == true 
	    end 
	end

	def check_file_type(obj,value)
		filename = obj.original_filename.gsub(/.*\./,"")
		case value
		when Symbol
		  raise InvalidTypeError if  filename != value.to_s
		when String
		  raise InvalidTypeError if filename != value
		when Array
		  raise InvalidTypeError if !value.map {|a| a.to_s}.include?(filename)
		else
		  raise InvalidCheckTypeError
		end
	end

	def check_max_size(obj,value)
		size = (obj.size.to_i)/1000
		case value
		when Fixnum
		  raise InvalidSizeError if size > value
		else
		  raise InvalidCheckTypeError
		end
	end
end
