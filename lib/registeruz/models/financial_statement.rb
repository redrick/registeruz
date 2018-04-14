module Registeruz
  module Models
    class FinancialStatement
      attr_accessor :id, :body, :period_from, :period_to, :submitted_at,
                    :assembled_at, :approved_at, :assembled_for_date,
                    :auditor_report_added_at, :subject_name, :ico, :dic,
                    :fond_name, :lei_code, :subject_id, :consolidated,
                    :consolidated_check_of_central_gov,
                    :comprehensiver_finstat_of_public_admin,
                    :type, :accounting_report_ids, :data_origin, :updated_at

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      # rubocop:disable Metrics/CyclomaticComplexity
      # rubocop:disable Metrics/PerceivedComplexity
      def initialize(body)
        @body = body
        @id = body['id']
        @period_from = Time.parse "#{body['obdobieOd']}-01" if body['obdobieOd']
        @period_to = Time.parse "#{body['obdobieDo']}-01" if body['obdobieDo']
        @submitted_at = Time.parse body['datumPodania'] if body['datumPodania']
        @assembled_at = Time.parse body['datumZostavenia'] if body['datumZostavenia']
        @approved_at = Time.parse body['datumSchvalenia'] if body['datumSchvalenia']
        if body['datumZostaveniaK']
          @assembled_for_date = Time.parse body['datumZostaveniaK']
        end
        if body['datumPrilozeniaSpravyAuditora']
          @auditor_report_added_at = Time.parse body['datumPrilozeniaSpravyAuditora']
        end
        @subject_name = body['nazovUJ']
        @ico = body['ico']
        @dic = body['dic']
        @fond_name = body['nazovFondu']
        @lei_code = body['leiKod']
        @subject_id = body['idUJ']
        @consolidated = body['konsolidovana']
        @consolidated_check_of_central_gov =
          body['konsolidovanaZavierkaUstrednejStatnejSpravy']
        @comprehensiver_finstat_of_public_admin =
          body['suhrnnaUctovnaZavierkaVerejnejSpravy']
        @type = body['typ']
        @accounting_report_ids = body['idUctovnychVykazov']
        @data_origin = body['zdrojDat']
        # rubocop:disable Style/GuardClause
        if body['datumPoslednejUpravy']
          @updated_at = Time.parse body['datumPoslednejUpravy']
        end
        # rubocop:enable Style/GuardClause
      end
      # rubocop:enable Metrics/PerceivedComplexity
      # rubocop:enable Metrics/CyclomaticComplexity
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize

      def subject
        ::Registeruz::Subject.find(@subject_id)
      end
    end
  end
end
