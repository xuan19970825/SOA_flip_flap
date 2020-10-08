# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  def take_tsv(tsv)
    @data = []
    tsv.each_line { |line| @data << line }
    @data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    @data
  end
end
