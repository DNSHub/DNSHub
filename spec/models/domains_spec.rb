require 'spec_helper'

describe Domain do
  subject(:domain) { build(:native_domain) }

  it "can't be empty" do
    domain.name = ""
    expect(domain).not_to be_valid
  end

  it "accept valid domain" do
    domain.name = "example.com"
    expect(domain).to be_valid
  end

  it "denied dot terminated domain" do
    domain.name = "example.com."
    expect(domain).not_to be_valid
  end
end

describe Domains, '#type' do
  subject(:domain) { build(:domain) }

  it "can't be empty" do
    expect(domain).not_to be_valid
  end

  it "accept NATIVE" do
    domain.type = "NATIVE"
    expect(domain).to be_valid
  end

  it "accept MASTER" do
    domain.type = "MASTER"
    expect(domain).to be_valid
  end

  it "accept SLAVE" do
    domain.type = "SLAVE"
    domain.master = "127.0.0.1"
    expect(domain).to be_valid
  end

  it "denied OTHER" do
    domain.type = "OTHER"
    expect(domain).not_to be_valid
  end
end

describe Domains, '#master' do
  subject(:slave_domain) { build(:slave_domain) }

  context "when type is SLAVE" do
    it "mustn't be empty" do
      slave_domain.master = ""
      expect(slave_domain).not_to be_valid
    end

    it "accept ip" do
      slave_domain.master = "127.0.0.1"
      expect(slave_domain).to be_valid
    end

    it "denied domains" do
      slave_domain.master = "example.com"
      expect(slave_domain).not_to be_valid
    end
  end
end
