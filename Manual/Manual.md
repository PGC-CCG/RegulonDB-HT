---
title: ""
--author: "RegulonDB Team"
--date: '02/07/2020'
output:
  html_document:
    fig_caption: yes
    highlight: zenburn
    includes:
    css: ./css/styleSheet_regulonDB.css
    self_contained: yes
---

# RegulonDB - High Throughput Collection User Guide
Last update: [Month] [Day], [Year]

## FAQs
- [How can I save my query?](#save-query)
- [How can I save my results?](#save-results)
- [How do I report an error or duplicate informaction in RegulonDB HT?](#report-error)

## High Throughput Collections
- [Transcription Factor Binding Sites (TFBSs)](#tfbs)
- [Transcription Units (TUs)](#tu)
- [Transcription Termination Sites (TTSs)](#tts)
- [Transcription Start Sites (TSSs)](#tss)
- [Gene Expression](#gene-expression)

## Search RegulonDB HT
- [How do I search RegulonDB HT?](#search)
- [How do I search by an specific value?](#search-specific-value)
  - [Searching by Growth Conditions](#search-gc)
- [How do I build an advanced query on High Throughput datasets?](#build-query)
  - [Combining search terms with boolean operators (AND, OR, NOT)](#search-boolean)

## Display, Sort, and Navigate
- [Visualizing search results](#view-results)
- [Understanding the search results](#understanding-results)
- [Navigating on the Genome Viewer](#nav-genome-viewer)
- [Customizing the graphic of the Genome Viewer](#graphic-genome-viewer)
- [Saving the graphic of the Genome Viewer](#save-genome-viewer)



___

<a name="save-query">How can I save my query?</a>  

<a name="save-results">How can I save my results?</a>  

<a name="report-error">How do I report an error or duplicate informaction in RegulonDB HT?</a>  


<a name="tfbs">Transcription Factor Binding Sites (TFBSs)</a>  

 __Overview__

[Describir el **proceso de curación** utilizado para el *análisis de datos* de **Transcripction Factor Binding Sites**.]


1. Numeración

2. Numeración 2

3. Numeración 2

   

[Agregar imágenes en caso de requerirse]  

[comment]: # <img src="./imgs/WorkflowHT.png" style="zoom:50%;" />



[Describir el contenido de los archivos de datos y metadatos.]  

- Punto 1
- Punto 2
- Punto 3


[Describir el en que consiste el proceso de verificación de datos]  

- Punto 1
- Punto 2
- Punto 3



| Encabezado 1 | Encabezado 2 | Encabezado 3 |
| ------------ | ------------ | ------------ |
| Valor 1      |              |              |
| Valor 2      |              |              |
| Valor 2      |              |              |


<br>
- **ChIP-seq, ChIP-exo and gSELEX**
<br><br>  

__Data gathering.__  
<br>
The **ChIP-seq** datasets encompass two types of data contained in two different tables: data as reported by authors, and data generated from our in-house processing of the raw data reported by the same authors. The TFBSs reported by authors were obtained mostly from supplementary material and the associated information described in the main text of publications.  ChIP-seq raw samples and metadata were downloaded systematically from the SRA and the EBI European nucleotide archive (ENA).  
<br>


Datasets derived from **gSELEX** were obtained mostly from data available in TEC database (https://shigen.nig.ac.jp/ecoli/tec/top/), and the associated information described in the publications. The ChIP-seq metadata was obtained mostly from the publications, and, in a few cases, from GEO files. Metadata for gSELEX was extracted from the corresponding publications. We also obtained the collection of experiments for 215 TFs in E. coli using DAP-seq from the recent publication (PMID: 34824476 ).  
<br>

__Curation and annotation__  
<br>
To build the dataset component with data as reported by authors, we retrieved the following features when available: TF name, peak and TFBS features, such as start- and end genomic coordinates, genomic sequence, statistical values from peak calling or motif prediction, experimental or computational evidence, and the closest gene, considered as the target gene.  When TF-binding experiments came with gene expression experiments, we also flagged target genes which showed changes in expression and p-value of differential expression, annotating the resulting TF-function, either activator or repressor, over the expression of target genes. These TFRSs support regulatory interactions uploaded into EcoCyc and RegulonDB.  



__Experimental Methodology__

[Describir el resultado obtenido de la ejecución del proceso para uniformar los datos de Chip-seq y Chip-exo. Especificar las entradas y cada una de las actividades que integran el flujo de trabajo.]  
<br>
_Results_  
<br>
__Dataset components__  
[Describir a detalle cada uno de los resultados obtenidos.]  
<br>

__Collection__  

  - _[Peak file]_  
    [Describir las columnas y datos que integran el contenido del archivo.]  
  
  - _[TFBS File]_  
    [Describir las columnas y datos que integran el contenido del archivo.]  
<br>

__Aditional components__

- _PSWM File_:  
    [Descripción del archivo.]  
    
- _PSWM Logo File_:  
    [Descripción del archivo.]  
    
- _Graphs Distributions_:  
    [Descripción del archivo.]  
    
- _Summary  Comparison File_:  
    [Descripción del archivo.]  

- _TFBS Comparison Feature Maps_:  
      [Descripción del archivo.]  
     
<br>
- **Other Transcription Factor Binding Sites dataset components**

<br>
__Experimental Methodology__  

[Describir el resultado obtenido de la ejecución del proceso para la obtención y manipulación de los datos. Especificar las entradas y cada una de las actividades que integran el flujo de trabajo.]  
<br>  

_Results_  
<br>  

__Dataset components__  
[Describir a detalle cada uno de los resultados obtenidos.]  
<br>  

__Author dataset TFBS excel files__  

  - [Incluir la descripción de cada uno de los diferentes tipos de archivos obtenidos.]  
<br>

__Metadata dataset Transcription Factor Binding Site v#.#__  

  - [Incluir la descripción de cada uno de los metadatos.]  



<a name="tu">Transcription Units (TUs)</a>  

<a name="tts">Transcription Termination Sites (TTSs)</a>  

<a name="tss">Transcription Start Sites (TSSs)</a> 

<a name="gene-expression">Gene Expression</a>  


<a name="search">How do I search RegulonDB HT?</a>  


<a name="search-specific-value">How do I search by an specific value?</a>  

<a name="search-gc">Searching by Growth Conditions</a>  


<a name="build-queryc">How do I build an advanced query on High Throughput datasets?</a>  

<a name="search-boolean">Combining search terms with boolean operators (AND, OR, NOT)</a>  


<a name="view-results">Visualizing search results</a>  

<a name="understanding-results">Understanding the search results</a>  

<a name="nav-genome-viewer">Navigating on the Genome Viewer</a>  

<a name="nav-genome-viewer">Navigating on the Genome Viewer</a>  

<a name="graphic-genome-viewer">Customizing the graphic of the Genome Viewer</a>  

<a name="save-genome-viewer">Saving the graphic of the Genome Viewer</a>  




