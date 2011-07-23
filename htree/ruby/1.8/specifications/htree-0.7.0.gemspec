# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{htree}
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tanaka Akira"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDMjCCAhqgAwIBAgIBADANBgkqhkiG9w0BAQUFADA/MREwDwYDVQQDDAhhZ3Bh\nY2tlcjEVMBMGCgmSJomT8ixkARkWBWdtYWlsMRMwEQYKCZImiZPyLGQBGRYDY29t\nMB4XDTEwMDEyNzIyMDMxOVoXDTExMDEyNzIyMDMxOVowPzERMA8GA1UEAwwIYWdw\nYWNrZXIxFTATBgoJkiaJk/IsZAEZFgVnbWFpbDETMBEGCgmSJomT8ixkARkWA2Nv\nbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANPdi8ZJbhAOeYtX4sqe\n3WsjCDKCSZagMAMBExHDnMq+/furdoHcD2v1acBvnCt1UH1u2yJtCHLdLgOK7AQR\nE/XRSNvuAhqjJFfuzWkvqDWBs5Aw5nQEUtWrEt5f7wiU7v4nHNa2FV4zYZCslKCv\nDNFDULy9N7iYv2L4RWUFDw+jxyuHki1sz4gYNWtLhYSZPvuICYm8GburWfOTMBos\nFi+T5csfU6P2yFpUi59UPX2H/8ckfLA+VuSwALVzj1Kj/qJ2lq9A4lHOwMNTQ1Zy\nQefTffufmADmN6yDasc+qDv0eZxx720TOEBCRxNGDDw8SzpdEWLxeXBxS91fujCR\n6NcCAwEAAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0OBBYEFF3L\n+uiqy+uhiRifGsIdqSuIbyblMA0GCSqGSIb3DQEBBQUAA4IBAQDNRaw0HFWyrt9y\nJyjbV1aNs0Jv1vldt2YERlQDUHwaBNSFzkXAbOf2Zn6igBw+cC7J9cEuj+6JkF0d\nVMnDnLe+KP/DI4PaHxKISylusm5hc1J4cjyg5FhF5xQAdnjpp8JvYGvC3/1sq0i6\nCR2+jrvqlNa5n/GBWrUpeAlfbnpxKfto4Jdeg+2+f0F9/nAw0thmpQ1iJs/m3tmA\niB/7xVX8dpDGeJAGSf+Xfa1lmGe1a//8nEUszlNPtG4a/4r2cN5s2NFk0KKuvlTf\nflvkJ7FlCt2CaB+Xsq+MFmODvF8t26zc4t0ZTv7jyHpkZb21nqiYw+mAZ9BGsbr5\n1/wPZ84P\n-----END CERTIFICATE-----\n"]
  s.date = %q{2010-01-27}
  s.description = %q{Htree provides a tree data structure which represent HTML and XML data}
  s.email = %q{akr@fsij.org}
  s.extra_rdoc_files = ["README", "lib/htree.rb", "lib/htree/container.rb", "lib/htree/context.rb", "lib/htree/display.rb", "lib/htree/doc.rb", "lib/htree/elem.rb", "lib/htree/encoder.rb", "lib/htree/equality.rb", "lib/htree/extract_text.rb", "lib/htree/fstr.rb", "lib/htree/gencode.rb", "lib/htree/htmlinfo.rb", "lib/htree/inspect.rb", "lib/htree/leaf.rb", "lib/htree/loc.rb", "lib/htree/modules.rb", "lib/htree/name.rb", "lib/htree/output.rb", "lib/htree/parse.rb", "lib/htree/raw_string.rb", "lib/htree/regexp-util.rb", "lib/htree/rexml.rb", "lib/htree/scan.rb", "lib/htree/tag.rb", "lib/htree/template.rb", "lib/htree/text.rb", "lib/htree/traverse.rb"]
  s.files = ["Makefile", "README", "Rakefile", "init.rb", "install.rb", "lib/htree.rb", "lib/htree/container.rb", "lib/htree/context.rb", "lib/htree/display.rb", "lib/htree/doc.rb", "lib/htree/elem.rb", "lib/htree/encoder.rb", "lib/htree/equality.rb", "lib/htree/extract_text.rb", "lib/htree/fstr.rb", "lib/htree/gencode.rb", "lib/htree/htmlinfo.rb", "lib/htree/inspect.rb", "lib/htree/leaf.rb", "lib/htree/loc.rb", "lib/htree/modules.rb", "lib/htree/name.rb", "lib/htree/output.rb", "lib/htree/parse.rb", "lib/htree/raw_string.rb", "lib/htree/regexp-util.rb", "lib/htree/rexml.rb", "lib/htree/scan.rb", "lib/htree/tag.rb", "lib/htree/template.rb", "lib/htree/text.rb", "lib/htree/traverse.rb", "test-all.rb", "test/assign.html", "test/template.html", "test/test-attr.rb", "test/test-charset.rb", "test/test-context.rb", "test/test-display_xml.rb", "test/test-elem-new.rb", "test/test-encoder.rb", "test/test-equality.rb", "test/test-extract_text.rb", "test/test-gencode.rb", "test/test-leaf.rb", "test/test-loc.rb", "test/test-namespace.rb", "test/test-output.rb", "test/test-parse.rb", "test/test-raw_string.rb", "test/test-rexml.rb", "test/test-scan.rb", "test/test-security.rb", "test/test-subnode.rb", "test/test-template.rb", "test/test-text.rb", "test/test-traverse.rb", "Manifest", "htree.gemspec"]
  s.homepage = %q{http://www.a-k-r.org/htree/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Htree", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{htree}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{HTML/XML tree library}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
