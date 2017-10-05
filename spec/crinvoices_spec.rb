require "spec_helper"

RSpec.describe CRInvoices do
  it "has a version number" do
    expect(CRInvoices::VERSION).not_to be nil
  end

  it "has a correct BASE URL development" do
    allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("development"))
    expect(CRInvoices.base_url).to eq(CRInvoices::STAGING_BASE_URL)
  end

  it "has a correct BASE URL production" do
    allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("production"))
    expect(CRInvoices.base_url).to eq(CRInvoices::PRODUCTION_BASE_URL)
  end

  it "returns a auth token" do
    allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("development"))
    expect(CRInvoices.getAuthToken("cpf-01-1397-0110@stag.comprobanteselectronicos.go.cr", "@B-.s_&&tW}{fHru#;FS").keys).to include("access_token")
  end

  it "returns a error not valid credentiasl auth token" do
    allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("development"))
    expect(CRInvoices.getAuthToken("cpf-01-1397-0110@stag.comprobanteselectronicos.go.cr", "blabla").keys).to include("error")
  end

end
