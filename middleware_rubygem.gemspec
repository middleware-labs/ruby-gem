# frozen_string_literal: true

require_relative "lib/middleware/ruby_gem/version"

Gem::Specification.new do |spec|
  spec.name          = "middleware_apm"
  spec.version       = Middleware::RubyGem::VERSION
  spec.authors       = ["middleware-dev"]
  spec.email         = ["dev@middleware.io"]

  spec.summary       = "APM is a practice and set of tools designed to monitor and manage the performance and availability of software applications. It involves tracking various metrics related to an application's behavior and performance, diagnosing issues, and optimizing its efficiency. APM tools aim to provide insights into an application's performance from end-users' perspective, as well as analyzing underlying infrastructure components."
  spec.description   = "The 'APM' (Application Performance Monitoring) Ruby gem provides developers with comprehensive insights into their software applications' performance and behavior. By monitoring end-user experiences, profiling code execution, tracing transaction flows, and tracking resource utilization, the gem assists in identifying bottlenecks, errors, and areas for optimization. Real-time alerts, error analysis, and trend tracking contribute to maintaining a smooth user experience, enhancing application scalability, and ensuring efficient resource utilization."
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/middleware-labs/ruby-gem"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
