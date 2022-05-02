require_relative '../../validation_test'

module IpaTestKit
  class CareTeamValidationTest < Inferno::Test
    include IpaTestKit::ValidationTest

    id :ipa_010_care_team_validation_test
    title 'CareTeam resources returned during previous tests conform to the IPA CareTeam Profile'
    description %(
This test verifies resources returned from the first search conform to
the [IPA CareTeam Profile](http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-careteam).

It verifies the presence of mandatory elements and that elements with
required bindings contain appropriate values. CodeableConcept element
bindings will fail if none of their codings have a code/system belonging
to the bound ValueSet. Quantity, Coding, and code element bindings will
fail if their code/system are not found in the valueset.

    )
    output :dar_code_found, :dar_extension_found

    def resource_type
      'CareTeam'
    end

    def scratch_resources
      scratch[:care_team_resources] ||= {}
    end

    run do
      perform_validation_test(scratch_resources[:all] || [], 'http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-careteam')
    end
  end
end