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

module Kaltura

	class KalturaTag < KalturaObjectBase
		attr_accessor :id
		attr_accessor :tag
		attr_accessor :tagged_object_type
		attr_accessor :partner_id
		attr_accessor :instance_count
		attr_accessor :created_at

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def instance_count=(val)
			@instance_count = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
	end

	class KalturaTagListResponse < KalturaObjectBase
		attr_accessor :objects
		attr_accessor :total_count

		def total_count=(val)
			@total_count = val.to_i
		end
	end

	class KalturaTagFilter < KalturaFilter
		attr_accessor :object_type_equal
		attr_accessor :tag_equal
		attr_accessor :tag_starts_with
		attr_accessor :instance_count_equal
		attr_accessor :instance_count_in

		def instance_count_equal=(val)
			@instance_count_equal = val.to_i
		end
		def instance_count_in=(val)
			@instance_count_in = val.to_i
		end
	end


	# Search object tags
	#  
	class KalturaTagService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		def search(tag_filter, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'tagFilter', tag_filter);
			client.add_param(kparams, 'pager', pager);
			client.queue_service_action_call('tagsearch_tag', 'search', kparams);
			if (client.is_multirequest)
				return nil;
			end
			return client.do_queue();
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :tag_service
		def tag_service
			if (@tag_service == nil)
				@tag_service = KalturaTagService.new(self)
			end
			return @tag_service
		end
	end

end
