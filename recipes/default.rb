#
# Cookbook Name:: audit
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# from https://learn.chef.io/controls-for-compliance/windows/create-a-basic-audit-control/
control_group 'Validate web services' do
  control 'Ensure no web files are owned by the Administrators group' do
    Dir.glob('c:/inetpub/wwwroot/**/*.htm') {|web_file|
      it "#{web_file} must not be owned by Administrators" do
        expect(command("(Get-ChildItem #{web_file} | Get-Acl).Owner").stdout).to_not
      end
    }
  end
end
