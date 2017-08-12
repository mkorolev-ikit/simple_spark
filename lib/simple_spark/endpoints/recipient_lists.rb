module SimpleSpark
  module Endpoints
    class RecipientLists
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def list
        @client.call(method: :get, path: 'recipient-lists')
      end

      def create(values)
        @client.call(method: :post, path: 'recipient-lists', body_values: values)
      end

      def retrieve(list_name)
        list_name = @client.url_encode(list_name)
        @client.call(method: :get, path: "recipient-lists/#{list_name}")
      end

      def update(list_name, values)
        list_name = @client.url_encode(list_name)
        @client.call(method: :put, path: "sending-domains/#{list_name}", body_values: values)
      end

      def delete(list_name)
        list_name = @client.url_encode(list_name)
        @client.call(method: :delete, path: "sending-domains/#{list_name}")
      end
    end
  end
end
