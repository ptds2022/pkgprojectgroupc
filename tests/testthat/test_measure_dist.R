source(here::here("functions/measure_dist.R"))

# Current location
address_applicant <- "Avenue des Bains 12, 1007 Lausanne"

# Gas station addresses
addresses <- c("Unter den Linden 25, 10117 Berlin", 
               "Avenue des Bains 12, 1007 Lausanne", 
               "Kurfürstendamm 100, 10709 Berlin")

test_results <- measure_dist(c(address_applicant, addresses))
print(test_results)

# Test
if (test_results$distance[3] != 0){
  stop("Something is wrong with the computation of measure_dist")
}
