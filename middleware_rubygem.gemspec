# frozen_string_literal: true

require_relative "lib/middleware/ruby_gem/version"

excluded_files = []
os = ""

if RUBY_PLATFORM =~ /mswin|mingw/
    excluded_files.push(
        'lib/middleware/auth/',
        'lib/middleware/profile/',
        'lib/middleware/ruby_gem_linux.rb',
        'middleware_rubygem_linux.gemspec'
    )
    os = "windows"
elsif RUBY_PLATFORM =~ /linux/
    excluded_files.push(
        'lib/middleware/ruby_gem_windows.rb',
        'middleware_rubygem_windows.gemspec'
    )
    os = "linux"
else 
    raise "$#{RUBY_PLATFORM} is not supported"
end

Gem::Specification.new do |spec|
  spec.name          = "middleware_apm_" + os
  spec.version       = Middleware::RubyGem::VERSION
  spec.authors       = ["middleware-dev"]
  spec.email         = ["dev@middleware.io"]

  spec.summary       = "APM is a practice and set of tools designed to monitor and manage the performance and availability of software applications. It involves tracking various metrics related to an application's behavior and performance, diagnosing issues, and optimizing its efficiency. APM tools aim to provide insights into an application's performance from end-users' perspective, as well as analyzing underlying infrastructure components."
  spec.description   = "The 'APM' (Application Performance Monitoring) Ruby gem provides developers with comprehensive insights into their software applications' performance and behavior. By monitoring end-user experiences, profiling code execution, tracing transaction flows, and tracking resource utilization, the gem assists in identifying bottlenecks, errors, and areas for optimization. Real-time alerts, error analysis, and trend tracking contribute to maintaining a smooth user experience, enhancing application scalability, and ensuring efficient resource utilization."
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"
  spec.add_dependency 'opentelemetry-sdk', '~> 1.5'
  spec.add_dependency 'opentelemetry-exporter-otlp', '~> 0.29.0'
  spec.add_dependency 'opentelemetry-instrumentation-all', '~> 0.65.0'
  spec.add_dependency 'opentelemetry-propagator-b3', '~> 0.21.0'
  spec.add_dependency 'pyroscope', '~> 0.5.12'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/middleware-labs/ruby-gem"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{\A(?:test|spec|features)/}) || excluded_files.any? { |excluded| f.include?(excluded) }
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
