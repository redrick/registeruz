module Registeruz
  module Models
    class Subject
      attr_accessor :id, :name, :city, :street, :postal_code, :founded_at,
                    :closed_at, :legal_form_id, :organization_size_id,
                    :ownership_type_id, :region_id, :district_id, :residence_id,
                    :data_origin, :updated_at, :ico, :dic, :sk_nace_code_id,
                    :consolidated

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      def initialize(body)
        @body = body
        @id = body['id']
        @name = body['nazovUJ']
        @city = body['mesto']
        @street = body['ulica']
        @postal_code = body['psc']
        @founded_at = Time.parse body['datumZalozenia'] if body['datumZalozenia']
        @closed_at = Time.parse body['datumZrusenia'] if body['datumZrusenia']
        @legal_form_id = body['pravnaForma']
        @organization_size_id = body['velkostOrganizacie']
        @ownership_type_id = body['druhVlastnictva']
        @region_id = body['kraj']
        @district_id = body['okres']
        @residence_id = body['sidlo']
        @data_origin = body['zdrojDat']
        @updated_at = Time.parse body['datumPoslednejUpravy'] if body['datumPoslednejUpravy']
        @ico = body['ico']
        @dic = body['dic']
        @sk_nace_code_id = body['skNace']
        @consolidated = body['konsolidovana']
      end
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize

      def legal_form
        ::Registeruz::Api::Codebook.find('pravne-formy', @body['pravnaForma'])
      end

      def organization_size
        ::Registeruz::Api::Codebook
          .find('velkosti-organizacie', @body['velkostOrganizacie'])
      end

      def ownership_type
        ::Registeruz::Api::Codebook
          .find('druhy-vlastnictva', @body['druhVlastnictva'])
      end

      def region
        ::Registeruz::Api::Codebook.find('kraje', @body['kraj'])
      end

      def district
        ::Registeruz::Api::Codebook.find('okresy', @body['okres'])
      end

      def residence
        ::Registeruz::Api::Codebook.find('sidla', @body['sidlo'])
      end

      def sk_nace_code
        ::Registeruz::Api::Codebook.find('sk-nace', @body['skNace'])
      end
    end
  end
end
