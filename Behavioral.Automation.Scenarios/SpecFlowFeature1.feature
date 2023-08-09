Feature: SpecFlowFeature1
	wiki:https://en.wikipedia.org/wiki/Primerdesign
	Primers are short DNA sequences that can be used to amplify parts of DNA
	


Scenario: user can design PCR primers using Primer-blast tool
	Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
	When user enters "TAATAAGCCCCCGTCACTGTTGGTTGAAGAGCCCAGGACGGGTTGGCCAGATGTGCGATTATATCGCTTAATGGCTCTTGGGCCGCGGTGCGTTACCTTGCAGGAATTGAGGCCGTCCGTTAATTTCCCTTGCATACATATTGCGTTTTTTTGTCTTTTTATCCGCTTACTTAGATAAGAGTGACATAGCTTCTTACCGGAGCGCCTCCGTACACAGTACGATCGCACGCCCCATGAGATCGATAGGTATACCAGGTGTCCTGTGAGCAACGAAAGCCTAAACGGGAAATACGCGGCCAAAAGTCGGTGCGAATACGAGTCGTAGCAATGTTGGTCTGGCTATGATCTACATATTTCAGGCGGTACGTCTGCTCTGGTCAGCCTCTAATGGCTCGTTAGATAGTCTAGCCGCTGGTAATCACTCGATGACCTCGGCTCCCCATTGGTGCTACGGCGATTCTTGGAGAGCCAGCTGCGATCGCTAATGTGAGGACAGTGTAATATTAGCAAGCGATAAGTCCCCAACTGGTTGTGGCCTTTTGAAAAGTGAACTTCATAACATATGCTGTCTCAC" into "template" input
	And user opens "database" dropdown and selects "Genomes for selected eucaryotik organisms" in dropdown menu
	And user clicks on "perform specificity check to unchecked" checkbox
	When user clicks on "get primers" button
	Then "primer design " table should become visible
	
	
	Scenario: User designs primers for DNA template with specified settings
		Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
		When user enters "TAATAAGCCCCCGTCACTGTTGGTTGAAGAGCCCAGGACGGGTTGGCCAGATGTGCGATTATATCGCTTAATGGCTCTTGGGCCGCGGTGCGTTACCTTGCAGGAATTGAGGCCGTCCGTTAATTTCCCTTGCATACATATTGCGTTTTTTTGTCTTTTTATCCGCTTACTTAGATAAGAGTGACATAGCTTCTTACCGGAGCGCCTCCGTACACAGTACGATCGCACGCCCCATGAGATCGATAGGTATACCAGGTGTCCTGTGAGCAACGAAAGCCTAAACGGGAAATACGCGGCCAAAAGTCGGTGCGAATACGAGTCGTAGCAATGTTGGTCTGGCTATGATCTACATATTTCAGGCGGTACGTCTGCTCTGGTCAGCCTCTAATGGCTCGTTAGATAGTCTAGCCGCTGGTAATCACTCGATGACCTCGGCTCCCCATTGGTGCTACGGCGATTCTTGGAGAGCCAGCTGCGATCGCTAATGTGAGGACAGTGTAATATTAGCAAGCGATAAGTCCCCAACTGGTTGTGGCCTTTTGAAAAGTGAACTTCATAACATATGCTGTCTCAC" into "template" input
		And user enters "30" into "Numbers of primers to return" input
		And user enters "min 59" into "primer melting temperatures" input
		And user enters "max 64 " into "primer melting temperatures" input
		And user enters "2000" into "Intron length range" input
		When user clicks on "get primers" button
		Then "Detailed primer reports " table should become visible
		
		
		
		Scenario: User sees error notification for invalid input (using boundary technique(69) )
			Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
			When user enters "TCCGTAACTGACTACGCCTTTCTCTAGACCTTACTTGACCAGATACACTGTCTTTGACACGTTGATGG" into "template" input
			And user clicks on "get primers" button
			Then label "Error" should have "PCR template length (69) is shorter than specified product min length 70" text
			
			
			
			Scenario:user sees error notification for invalid input (using Error Guess technique -leave empty)
				Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
				When user enters "0" into "template" input
				And user clicks on "get primers" button
				Then label "Error" should have "Exception error: No sequence input was provided " text
				
				
			
