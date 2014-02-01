require 'spec_helper'

describe Record, '#content' do
  context "A record" do
    subject(:record) { build(:a_record, :master_domain) }

    it "has a valid factory" do
      expect(record).to be_valid
    end

    it "must be present" do
      record.content = nil
      expect(record).not_to be_valid
    end

    it "accept ip" do
      record.content = "127.0.0.1"
      expect(record).to be_valid
    end

    it "denied domains" do
      record.content = "example.com"
      expect(record).not_to be_valid
    end
  end

  context "CNAME record" do
    subject(:record) { build(:cname_record, :master_domain) }

    it "has a valid factory" do
      expect(record).to be_valid
    end

    it "must be present" do
      record.content = nil
      expect(record).not_to be_valid
    end

    it "accept domains" do
      record.content = "example.com"
      expect(record).to be_valid
    end

    it "denied domains with terminated dot" do
      record.content = "example.com."
      expect(record).not_to be_valid
    end
  end

  context "SOA record" do
    subject(:record) { build(:soa_record, :master_domain) }

    it "has a valid factory" do
      expect(record).to be_valid
    end

    it "must be present" do
      record.content = nil
      expect(record).not_to be_valid
    end

    it "denied invalid domain" do
      record.content = "example.com. admin@example.com 1 2 3 4 5"
      expect(record).not_to be_valid
    end

    it "denied invalid email" do
      record.content = "example.com admin(a)example.com 1 2 3 4 5"
      expect(record).not_to be_valid
    end

    it "denied invalid uint" do
      record.content = "example.com admin@example.com 1 2 3 four 5"
      expect(record).not_to be_valid
    end

    it "denied not well formed" do
      record.content = "example.com admin@example.com 1 2 3 5"
      expect(record).not_to be_valid
    end
  end
end

describe Record, '#name' do
  subject(:record) { build(:a_record, :master_domain) }

  it "has a valid factory" do
    expect(record).to be_valid
  end

  it "accept domains" do
    record.name = "www.example.com"
    expect(record).to be_valid
  end

  it "denied domains with terminated dot" do
    record.name = "www.example.com."
    expect(record).not_to be_valid
  end
end

describe Record, '#record_type?' do
  subject(:record) { build(:a_record, :master_domain) }

  it "has a valid factory" do
    expect(record).to be_valid
  end

  it { expect(record).to be_record_type(:a) }
  it { expect(record).not_to be_record_type(:cname) }
end

describe Record, '#type' do
  subject(:record) { build(:a_record, :master_domain) }

  it "has a valid factory" do
    expect(record).to be_valid
  end

  it "denied unknown types" do
    record.type = "XXX"
    expect(record).not_to be_valid
  end
end