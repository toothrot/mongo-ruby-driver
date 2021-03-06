# Copyright (C) 2009-2014 MongoDB, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'mongo/grid/file_store'
require 'mongo/grid/file'

module Mongo

  class GridError < StandardError; end

  module Grid

    # Default prefix for the 'files' and 'chunks' collections
    #
    # @since 2.0.0
    DEFAULT_FS_NAME = 'fs'.freeze

    # Default size for chunks of data.
    #
    # @since 2.0.0
    DEFAULT_CHUNK_SIZE = (255 * 1024).freeze

    # Default content type for stored files.
    #
    # @since 2.0.0
    DEFAULT_CONTENT_TYPE = 'binary/octet-stream'.freeze
  end
end
