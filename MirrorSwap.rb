require 'csv'

arrayOfAllElements = []
path = 'path/to/file.csv'

PCBWidth = 76.0

CSV.foreach(path, headers: true) do |row|
  row = row.to_hash
  xCoord = (row["DeltX"].to_i).abs
  xCoord = PCBWidth - xCoord
  row["DeltX"] = xCoord
  arrayOfAllElements << row
end


File.open(path.gsub('file.csv','fileMirrored.csv'), 'w') do |file|
  csv = CSV.new(file, headers: CSV.read(path).first, write_headers: true)
  arrayOfAllElements.each do |el|
    csv << el.values
  end
end
