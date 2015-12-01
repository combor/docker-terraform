require 'docker'

#Docker.url = "https://192.168.99.100:2376"

describe "Terraform image" do
    before(:all) {
        @image = Docker::Image.all().detect{|i| i.info['RepoTags'].include? 'terraform:latest' }
    }
    
    it "should be availble" do
        expect(@image).to_not be_nil
    end
end
