PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX tifn: <http://www.tifn.nl/research/ontology#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>


SELECT DISTINCT ?activity ?activity_label ?activity_type ?concept ?concept_label ?concept_type WHERE {
  {
    ?activity tifn:output ?concept .
  } UNION {
    ?activity tifn:hasLabEntry ?concept .
  }
  
    ?activity rdfs:label ?activity_label .
    OPTIONAL { ?activity rdf:type ?activity_type . FILTER(?activity_type != tifn:ResearchConcept && ?activity_type != tifn:ResearchQuestion) }
    ?concept rdfs:label ?concept_label .
    OPTIONAL { ?concept rdf:type ?concept_type . FILTER(?concept_type != tifn:ResearchConcept && ?concept_type != tifn:Activity ) }
    
  
  
  
} 