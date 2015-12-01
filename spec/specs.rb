require 'docker'
require 'serverspec'

describe "Terraform image" do
    before(:all) {
        @image = Docker::Image.all().detect{|i| i.info['RepoTags'].include? 'terraform:latest' }
        set :os, family: :debian
        set :backend, :docker
        set :docker_image, @image.id
    }
    
    it "should be availble" do
        expect(@image).to_not be_nil
    end

    it "installs the right version of Ubuntu" do
        expect(os_version).to include("Ubuntu 14")
    end

    def os_version
        command("lsb_release -a").stdout
    end

    it "installs required packages" do
        expect(package("unzip")).to be_installed
    end

    it "installs required packages" do
        expect(package("openssh-client")).to be_installed
    end

    it "installs required packages" do
        expect(package("wget")).to be_installed
    end

    it "checks if terraform binary is executable" do
         expect(file("/usr/local/bin/terraform")).to be_mode 775
    end

    it "has the Terraform version 0.6.7" do
        expect(terraform_version).to include("0.6.7")
    end

    def terraform_version
        command("terraform version").stdout
    end
end
