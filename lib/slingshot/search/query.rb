module Slingshot
  module Search

    class Query
      attr_reader :value

      def term(field, value)
        @value = { :term => { field => value } }
      end

      def terms(field, value, options={})
        @value = { :terms => { field => value } }
        @value[:terms].update( { :minimum_match => options[:minimum_match] } ) if options[:minimum_match]
        @value
      end

      def query(value, options={})
        @value = { :query_string => { :query => value } }
        @value[:query_string].update( { :default_field => options[:default_field] } ) if options[:default_field]
        # TODO: https://github.com/elasticsearch/elasticsearch/wiki/Query-String-Query
        @value
      end

      def to_json
        @value.to_json
      end

    end

  end
end
