require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do
  let(:diary) { double :diary }
  let(:new_secret_diary) { SecretDiary.new(diary) }
  context "when locked" do
    it "refuses to be read" do
      expect(new_secret_diary.read).to eq("Go away!")
    end

    it "refuses to be written" do
      expect(new_secret_diary.write("")).to eq("Go away!")
    end
  end

  context "when unlocked" do
    it "gets read" do
      expect(diary).to receive(:read).and_return("Diary received read method!")
      new_secret_diary.unlock
      expect(new_secret_diary.read).to eq("Diary received read method!")
    end

    pending "gets written"
  end
end
