
<!-- README.md is generated from README.Rmd. Please edit that file -->

# muddy\_db <img src="man/figures/README-hex.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
![R-CMD-check](https://github.com/TracyRage/muddy_db/workflows/R-CMD-check/badge.svg)
<!-- badges: end -->

### Description

**muddy\_db** represents a biologically-oriented mud volcano database.
It aggregates mud volcano specific terminology and taxonomy, which were
mined from open-access articles, available in the
[S2ORC](https://github.com/allenai/s2orc/) database (Lo et al. 2020). We
used [ScispaCy](https://github.com/allenai/scispacy) (Neumann et al.
2019) models and [ETE3](https://github.com/etetoolkit/ete)
(Huerta-Cepas, Serra, and Bork 2016) library to check taxonomy-flavored
tokens against [NCBI Taxonomy](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/)
database.

Check our mining pipeline:
[muddy\_mine](https://github.com/TracyRage/muddy_mine)

### Data

**muddy\_db** includes the following data:

  - Bacterial and archaeal taxonomy (phylum, class, order, family,
    genus)
  - Chemistry (inorganic ions, hydrocarbons)
  - Geology (geological periods, minerals)
  - Mud volcano specific data (microbial consortia, metabolic pathways
    etc.)
  - Methods (amplified genes, analytics)

### References

<div id="refs" class="references">

<div id="ref-cepas_2016">

Huerta-Cepas, Jaime, François Serra, and Peer Bork. 2016. “ETE 3:
Reconstruction, Analysis, and Visualization of Phylogenomic Data.”
*Molecular Biology and Evolution* 33 (6): 1635–8.
<https://doi.org/10.1093/molbev/msw046>.

</div>

<div id="ref-lo-wang-2020-s2orc">

Lo, Kyle, Lucy Lu Wang, Mark Neumann, Rodney Kinney, and Daniel Weld.
2020. “S2ORC: The Semantic Scholar Open Research Corpus.” In
*Proceedings of the 58th Annual Meeting of the Association for
Computational Linguistics*, 4969–83. Online: Association for
Computational Linguistics.
<https://doi.org/10.18653/v1/2020.acl-main.447>.

</div>

<div id="ref-neumann_2019_scispacy">

Neumann, Mark, Daniel King, Iz Beltagy, and Waleed Ammar. 2019.
“ScispaCy: Fast and Robust Models for Biomedical Natural Language
Processing.” In *Proceedings of the 18th Bionlp Workshop and Shared
Task*, 319–27. Florence, Italy: Association for Computational
Linguistics. <https://doi.org/10.18653/v1/W19-5034>.

</div>

</div>