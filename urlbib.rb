require 'bibtex'
bib = BibTeX.open('./ArchitecturePatterns.bib')
list = bib['@misc']

list.each do |entry|
  unless entry[:urldate].nil?
    date = entry.urldate.gsub(/[\/]/,"-")
    # make sure all dates are with a - instead of a /
    entry[:note] = "Accessed: #{date}"
  end
end

list = bib['@misc']
list.each do |entry|
  unless entry[:urldate].nil?
    puts "Updated entry #{entry}"
  end
end

bib.save