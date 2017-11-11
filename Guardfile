guard :shell do
  watch(/phone_holder.rb/) { system('ruby phone_holder.rb') }
  watch(%r{^lib/.+/.+\.rb}) { system('ruby phone_holder.rb') }
end
