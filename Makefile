.PHONY: download-formulas


download-formulas:
	wget https://raw.githubusercontent.com/Homebrew/homebrew-core/refs/heads/master/Formula/g/git.rb -O Formula/git.rb
	wget https://raw.githubusercontent.com/Homebrew/homebrew-core/refs/heads/master/Formula/e/elfutils.rb -O Formula/elfutils.rb
	wget https://raw.githubusercontent.com/Homebrew/homebrew-core/refs/heads/master/Formula/u/util-linux.rb -O Formula/util-linux.rb


