# this script adds the note field to the bib entries so it generates the Accessed + date on urls
# To get this working:
# install ruby
# on commandline "gem install bibtex-ruby"
# then for conversion, go to the plop2013 folder
# ruby urlbib.rb 

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