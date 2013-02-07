# ===================================================================================================
#                           _  __     _ _
#                          | |/ /__ _| | |_ _  _ _ _ __ _
#                          | ' </ _` | |  _| || | '_/ _` |
#                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
#
# This file is part of the Kaltura Collaborative Media Suite which allows users
# to do with audio, video, and animation what Wiki platfroms allow them to do with
# text.
#
# Copyright (C) 2006-2011  Kaltura Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http:#www.gnu.org/licenses/>.
#
# @ignore
# ===================================================================================================
require 'kaltura_client.rb'
require File.dirname(__FILE__) + '/kaltura_event_notification_client_plugin.rb'

module Kaltura

	class KalturaEmailNotificationTemplatePriority
		HIGH = 1
		NORMAL = 3
		LOW = 5
	end

	class KalturaEmailNotificationTemplateOrderBy
		ID_ASC = "+id"
		ID_DESC = "-id"
		CREATED_AT_ASC = "+createdAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaEmailNotificationDispatchJobData < KalturaEventNotificationDispatchJobData
		# Define the email sender email
		# 	 
		attr_accessor :from_email
		# Define the email sender name
		# 	 
		attr_accessor :from_name
		# Email recipient emails and names, key is mail address and value is the name
		# 	 
		attr_accessor :to
		# Email cc emails and names, key is mail address and value is the name
		# 	 
		attr_accessor :cc
		# Email bcc emails and names, key is mail address and value is the name
		# 	 
		attr_accessor :bcc
		# Email addresses that a replies should be sent to, key is mail address and value is the name
		# 	 
		attr_accessor :reply_to
		# Define the email priority
		# 	 
		attr_accessor :priority
		# Email address that a reading confirmation will be sent to
		# 	 
		attr_accessor :confirm_reading_to
		# Hostname to use in Message-Id and Received headers and as default HELO string. 
		# 	 If empty, the value returned by SERVER_NAME is used or 'localhost.localdomain'.
		# 	 
		attr_accessor :hostname
		# Sets the message ID to be used in the Message-Id header.
		# 	 If empty, a unique id will be generated.
		# 	 
		attr_accessor :message_id
		# Adds a e-mail custom header
		# 	 
		attr_accessor :custom_headers
		# Define the content dynamic parameters
		# 	 
		attr_accessor :content_parameters

		def priority=(val)
			@priority = val.to_i
		end
	end

	class KalturaEmailNotificationTemplateBaseFilter < KalturaEventNotificationTemplateFilter

	end

	class KalturaEmailNotificationTemplateFilter < KalturaEmailNotificationTemplateBaseFilter

	end


end
