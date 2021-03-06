# Linux laptop packages

control 'install-01' do
  impact 1.0
  title 'Terraform'
  desc 'Terraform should be functionnal'
  describe command('terraform -version') do
    its('exit_status') { should eq 0 }
  end
end

control 'install-02' do
  impact 1.0
  title 'Vagrant'
  desc 'Vagrant should be functionnal'
  describe command('vagrant --version') do
    its('exit_status') { should eq 0 }
  end
end

control 'install-03' do
  impact 1.0
  title 'Packer'
  desc 'Packer should be functionnal'
  describe command('packer --version') do
    its('exit_status') { should eq 0 }
  end
end

control 'install-04' do
  impact 1.0
  title 'Terragrunt'
  desc 'Terragrunt should be functionnal'
  describe command('terragrunt --version') do
    its('exit_status') { should eq 0 }
  end
end

control 'install-05' do
  impact 1.0
  title 'Atom'
  desc 'Atom.io should be installed'
  describe package('atom') do
    it { should be_installed }
  end
end

control 'install-06' do
  impact 1.0
  title 'Python'
  desc 'Python should be functionnal'
  describe package('python --version') do
    its('exit_status') { should eq 0 }
  end
end
