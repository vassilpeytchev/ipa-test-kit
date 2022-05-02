require_relative '../../must_support_test'

module IpaTestKit
  class DiagnosticReportNoteMustSupportTest < Inferno::Test
    include IpaTestKit::MustSupportTest

    title 'All must support elements are provided in the DiagnosticReport resources returned'
    description %(
      IPA Responders SHALL be capable of populating all data elements as
      part of the query results as specified by the IPA Server Capability
      Statement. This test will look through the DiagnosticReport resources
      found previously for the following must support elements:

      * DiagnosticReport.category
      * DiagnosticReport.code
      * DiagnosticReport.effective[x]
      * DiagnosticReport.encounter
      * DiagnosticReport.issued
      * DiagnosticReport.performer
      * DiagnosticReport.presentedForm
      * DiagnosticReport.status
      * DiagnosticReport.subject
    )

    id :ipa_010_diagnostic_report_note_must_support_test

    def resource_type
      'DiagnosticReport'
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:diagnostic_report_note_resources] ||= {}
    end

    run do
      perform_must_support_test(all_scratch_resources)
    end
  end
end