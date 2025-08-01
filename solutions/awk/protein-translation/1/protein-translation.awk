BEGIN {
  protein["AUG"] = "Methionine"
  protein["UUU"] = \
  protein["UUC"] = "Phenylalanine"
  protein["UUA"] = \
  protein["UUG"] = "Leucine"
  protein["UCU"] = \
  protein["UCC"] = \
  protein["UCA"] = \
  protein["UCG"] = "Serine"
  protein["UAU"] = \
  protein["UAC"] = "Tyrosine"
  protein["UGU"] = \
  protein["UGC"] = "Cysteine"
  protein["UGG"] = "Tryptophan"
  protein["UAA"] = \
  protein["UAG"] = \
  protein["UGA"] = "STOP"
}

{
  rna = $1

  # loop over all 3-letter codons in RNA sequence
  while (rna) {
    # get codon and update RNA
    codon = substr(rna,1,3)
    rna = substr(rna,4)

    # check if condon is in our known protein list
    if (codon in protein) {
      # STOP protein breaks the while-loop
      if (protein[codon] == "STOP")
        break

      # any other protein gets added to the result
      result = result ? result " " protein[codon] : protein[codon]
    } else {
      # unknown codon in RNA
      print "Invalid codon"
      exit 1
    }
  }

  print result
}