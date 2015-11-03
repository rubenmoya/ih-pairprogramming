require "pry"

class Srt
	def initialize(file)
		@file = IO.read(file)
		@subtitles = []
	end

	def parse_srt
		a = @file.split(/\n?^\d+\n/)
		a.each do |line|
			line.scan(/(\d{2}:\d{2}:\d{2},?\d{0,3}).+(\d{2}:\d{2}:\d{2},?\d{0,3})(.+)/) do |time_start, time_end, z|
				@subtitles << {start: time_start, end: time_end, text: z}
			end
		end
		puts @subtitles
	end
end

c = Srt.new("subtitles.srt")
c.parse_srt
