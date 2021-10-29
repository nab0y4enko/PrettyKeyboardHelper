Pod::Spec.new do |s|
  s.name = 'PrettyKeyboardHelper'
  s.version = '2.0.0'
  s.summary = 'A helper for keyboard notifications.'
  s.description = 'A safe helper for keyboard notifications written in Swift.'
  s.homepage = 'https://github.com/nab0y4enko/PrettyKeyboardHelper'
  s.screenshots = 'https://raw.githubusercontent.com/nab0y4enko/PrettyKeyboardHelper/master/demo%201.gif', 'https://raw.githubusercontent.com/nab0y4enko/PrettyKeyboardHelper/master/demo%202.gif'
  s.license = 'MIT'
  s.author = { 'Oleksii Naboichenko' => 'nab0y4enko@gmail.com' }
  s.platform = :ios, '13.0'
  s.source = { :git => 'https://github.com/nab0y4enko/PrettyKeyboardHelper.git', :tag => '#{s.version}' }
  s.source_files = 'PrettyKeyboardHelper/*.swift'
  s.frameworks = 'Foundation', 'UIKit'
  s.dependency 'PrettyUtils'
end
