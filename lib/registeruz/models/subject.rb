module Registeruz
  module Models
    class Subject
      attr_accessor :id, :name, :city, :street, :postal_code, :founded_at,
                    :closed_at, :legal_form, :organization_size, :ownership_type,
                    :region, :district, :residence, :data_origin, :updated_at,
                    :ico, :dic, :sk_nace_code, :consolidated

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      def initialize(body)
        @id = body['id']
        @name = body['nazovUJ']
        @city = body['mesto']
        @street = body['ulica']
        @postal_code = body['psc']
        @founded_at = Time.parse body['datumZalozenia']
        @closed_at = Time.parse body['datumZrusenia'] if body['datumZrusenia']
        @legal_form = ::Registeruz::Api::Codebook
                      .find('pravne-formy', body['pravnaForma'])
        @organization_size = ::Registeruz::Api::Codebook
                             .find('velkosti-organizacie', body['velkostOrganizacie'])
        @ownership_type = ::Registeruz::Api::Codebook
                          .find('druhy-vlastnictva', body['druhVlastnictva'])
        @region = ::Registeruz::Api::Codebook.find('kraje', body['kraj'])
        @district = ::Registeruz::Api::Codebook.find('okresy', body['okres'])
        @residence = ::Registeruz::Api::Codebook.find('sidla', body['sidlo'])
        @data_origin = body['zdrojDat']
        @updated_at = Time.parse body['datumPoslednejUpravy']
        @ico = body['ico']
        @dic = body['dic']
        @sk_nace_code = ::Registeruz::Api::Codebook.find('sk-nace', body['skNace'])
        @consolidated = body['konsolidovana']
      end
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize
    end
  end
end
