\* To run the code, unzip app/csv-dataset/zipped-datasets and place them in app/csv-dataset

# youreka-2025

## Airborne Hazards and Tickborne Threats: the Link Between Air Pollution and Lyme Disease

### Abstract
 The purpose of this study is to investigate the nature of any potential correlation between exposure to air pollutants (ozone, sulfur dioxide, carbon monoxide, nitrogen dioxide, PM 2.5, and PM 10) and the annual Lyme disease, or *Lyme borreliosis*, incidence in the United States of America. The average yearly air-pollution exposure over a period of 10 years was compared with county-level data for Lyme disease incidence in 2023. After accounting for urbanization through only considering areas with a significant Blacklegged tick, or *Ixodes scapularis*, population, a linear regression model was made and Pearson's coefficient of correlation was calculated. A multiple linear regression model was also made, with the p and t values being calculated. From these tests, there was no correlation between ozone, sulfur dioxide, nitrogen dioxide, or PM2.5 exposure and Lyme disease incidence. Instead, Lyme disease incidence and exposure to PM10 have a significant negative correlation. There appears to be a negative correlation for Lyme disease and carbon monoxide, though it is likely a proxy for other factors.

 ### Introduction
 Lyme disease, also known as *Lyme borreliosis*, is one of the most common vector-borne illnesses, with almost 90 000 cases in the U.S. in 2023 (CDC, 2025a; Skar et al., 2024). In the U.S., it is usually caused by the *Borrelia burgdorferi* bacteria and spread by the bites of ticks in the genus *Ixodes* (Skar et al., 2024). It is most common in the Northeastern and Midwestern regions of the U.S., where *Ixodes scapularis* is the most common spreader (Skar et al., 2024). 

Lyme disease is transmitted as the tick feeds on its host's blood (Skar et al., 2024). Feeding occurs during the larva, nympth, and female adult life stages (Murray & Shapiro, 2010). The larva and nymph stages occur between spring and fall, and thus Lyme disease is most often reported during those seasons (Murray & Shapiro, 2010). During feeding, *Borrelia burgdorferi* bacteria in the tick's midgut move to the tick's salivary glands, where it can infect the host (Skar et al., 2024). This process is often time consuming, so often the tick must remain attached to human hosts for 15+ hours for infection to occur (Skar et al., 2024). 

As Lyme disease is spread through *Ixodes scapularis*, the population of these ticks as well as behaviour which places humans closer in contact with ticks (e.g. spending time outside) are likely correlated with Lyme disease incidence (Sharareh et al., 2019). Other factors which influence tick behaviour, such as vegetation and predator and host populations, are also correlated with either an increase or decrease in Lyme disease incidence (Sharareh et al., 2019). In particular, areas undergoing urbanization appear to be at the highest risk of Lyme disease (Guo et al., 2022).

The U.S. Environmental Protection Agency's Air Quality Index (AQI) measures air quality and pollution levels (AirNow, n.d.). The AQI is calculated for five major pollutants from the Clean Air Act: ground-level ozone, sulfur dioxide, carbon monoxide, nitrogen dioxide, and particulate matter, which includes PM2.5 and PM10 (AirNow, n.d.). These are the central air pollutants in this study. 

This study tests the hypothesis that level of the six aforementioned pollutants and rate of new Lyme disease cases in the U.S. are correlated. Air pollution can impact the health and behaviour of various tick hosts as well as ticks themselves (Guo et al., 2012; Zvereva & Kozlov, 2009). Additionally, several air pollutants are correlated with climate change, which in turn influences which habitats are suitable for ticks and their hosts (Brownstein et al., 2005; Pinho-Gomes et al., 2023). For example, climate change is associated with an increase in particulate matter since warming temperatures are associated with more frequent wildfires, which generate particulate matter (Pinho-Gomes et al., 2023). Thus, it is likely that air pollution levels are correlated with Lyme disease incidence.

Investigating the nature of this potential relationship may further understanding of tick behaviour and improve the risk assessment for Lyme disease.

### Methadology
This study was conducted using county-level data in the USA. Data on the number of Lyme disease cases in 2023 per county was sourced from the governmental site, the Center for Disease Control and Prevention. The estimated total population of each county in 2023 was sourced from the United States Census Bureau. In each county, Lyme disease incidence in 2023 per 100 000 people was then calculated.

Data on the daily average pollution levels per county from the U.S. Environmental Protection Agency was utilized determine the average pollution level for ozone, sulfur dioxide, carbon monoxide, nitrogen dioxide, PM2.5, and PM10 in 2023. Linear regression were performed with the R programming language with Lyme disease rates as the dependent variable and the level of various air pollutants as the independent variable. The Pearson correlation coefficient was calculated to determine the strength and nature of any relationship, with a threshold of 0.3 for |r| being considered statistically significant. A multiple linear regression was also performed between Lyme disease incidence and the levels of ozone, sulfur dioxide, carbon monoxide, nitrogen dioxide, PM2.5, and PM10 as independent variables. None of the air pollutant levels had strong correlations with each other. The p and t values were calculated to determine the nature of any relationship.

Information on the status of *Ixodes scapularis* populations per county in 2023 was collected from the Center for Disease Control and Prevention. Populations are considered "established" in a county if, at any point in the past, ticks in at least 2 life stages or 6 ticks in the same stage were detected within a 12-month period. To account for the role of tick prevalence in Lyme disease rates and help control for the effect of urbanization, only counties with an “established” *Ixodes scapularis* population were used in the regressions. 

### Results and Discussion

#### Ozone
Ozone levels were not significantly associated with Lyme disease incidence in either model. Ozone is a secondary pollutant that forms through chemical reactions involving sunlight and precursor emissions, making it highly variable and often more regionally diffuse than localized pollutants like PM10 (US EPA, 2015). Because ozone does not consistently reflect ground-level ecological conditions or land use changes, it may be less relevant to the specific pathways that affect tick habitats or human behavior in tick-endemic areas.

#### Sulfur dioxide
Sulfur dioxide, typically emitted from power plants and industrial sources, did not correlate with Lyme disease incidence (US EPA 2023). Within counties where ticks are already established, SO₂ concentrations may not strongly reflect natural habitat features or human behavior relevant to tick exposure. Since SO₂ is often regulated and concentrated near point sources, its ecological influence is likely too localized or inconsistent to drive broad trends in vector-borne disease transmission.

#### Carbon monoxide
Carbon monoxide showed a significant negative association with Lyme disease in simple linear regression, but this effect disappeared in the multiple linear model. While CO is commonly linked to traffic and combustion sources, its presence in rural, tick-endemic areas may also reflect land use patterns such as controlled agricultural burns, logging, or wildfires—all of which can elevate CO levels while disrupting or fragmenting natural tick habitats (Andreae & Merlet, 2001). These changes may reduce the density of host animals or alter human interaction with the environment, thereby lowering tick exposure risk (Rose et al., 2017). Additionally, higher CO levels may indirectly signal reduced outdoor activity due to air quality concerns, further lowering the chance of tick-human contact. The loss of significance in the multivariate model suggests that CO may not independently drive Lyme disease risk but could instead act as a proxy for other ecological or behavioral variables more directly captured by other pollutants like PM10.

#### Nitrogen dioxide
Nitrogen dioxide showed no significant association with Lyme disease, which may be due to its role as a traffic-related pollutant that is more tightly linked to urban infrastructure (Beckwith et al., 2019). Because urbanization was accounted for by restricting analysis to counties with established tick populations, NO₂ likely lost its utility as a proxy for environmental change. Moreover, NO₂ may not directly impact vegetation or host animal behavior in a way that would meaningfully alter Lyme disease risk.

#### PM2.5
Despite its chemical and physical similarities to PM10, PM2.5 did not show a significant relationship with Lyme disease incidence in either regression model. This could be because PM2.5 is more strongly tied to combustion-related pollution (e.g., from vehicles and industrial activity) rather than the soil- and dust-based sources that produce PM10 (California Air Resources Board, 2015). Within tick-endemic counties, PM2.5 levels may not be a strong indicator of land disturbance or habitat quality—factors more likely to affect human-tick interaction rates.

#### PM10
PM10 was the only pollutant that retained a significant negative association with Lyme disease rates in the multiple linear regression model. Since this analysis was limited to counties with established *Ixodes scapularis* populations, the effect is unlikely to be driven by urbanization alone. One possible explanation is that higher PM10 levels, often linked to road dust, construction, and disturbed soil, may indicate fragmented or degraded ecosystems that reduce the quality of tick habitats or alter the distribution of key hosts such as deer and mice (Jackson et al., 2006). Additionally, residents in more polluted counties may spend less time outdoors, reducing opportunities for tick exposure even in areas where ticks are present (Neidell, 2009).

#### Limitations
Not all counties that reported Lyme disease cases had data about average pollution levels, and thus several counties were excluded from our tests, resulting in a smaller sample size that may be less representative of all U.S. counties. 

This study assumes that counties have a uniform distribution of air pollution, Lyme disease infection, and level of other confounding variables. The use of annual county-level data masks the effect of seasonal variation of tick and human behaviour, as well as the variation of land use, population density, and other such conditions within a county. In addition, the Lyme disease data records the county that infected persons reside in, not necessarily where they were infected, and this study assumes that people were infected in their county of residence. Another limitation of the datasets is that counties that met the "established" tick population criteria were classified as "established" in all subsequent years, though it is possible that they have since experienced a significant decrease in tick populations, thus rendering their "established" status inaccurate. The research assumes that all "established" counties have maintained their tick population.

There were also several confounding variables the study could not account for, such as host behaviour, vegetation density, other climate factors, and urbanization levels. The data also did not differentiate between Lyme disease cases caused by different bacteria species or transmitted by different species of ticks. It is possible that air pollution affects the various bacteria and tick species differently. Some of these factors are somewhat mediated by only using data from counties with an established population of *Ixodes scapularis*. Furthermore, the demographics and socioeconomic characteristics of infected persons were not considered, which may influence their exposure to ticks or their immune system's ability to prevent Lyme disease infection. 

Finally, this is a cross-sectional study that only analyzes data from one year, so temporal relationships could not be closely examined.

#### Next Steps
By identifying a negative relationship between PM10 levels and Lyme disease incidence in tick-endemic counties, the findings suggest that air pollution may play a previously unrecognized role in modulating human exposure to ticks, potentially through changes in habitat quality or human behavior. Importantly, this challenges the assumption that pollution is always a proxy for urbanization and highlights the value of controlling for ecological context, such as tick establishment, in disease modeling.

These results could inform public health strategies by encouraging the integration of environmental pollution data into Lyme disease risk assessments, particularly in rural or suburban areas where pollution and tick presence coexist. Areas with unexpectedly low Lyme disease rates despite tick presence and low PM10 levels could be flagged for further ecological investigation. Moreover, the study emphasizes the need for more interdisciplinary approaches that connect epidemiology, environmental science, and ecology to better understand how modern human-altered landscapes influence disease dynamics.

To build on these findings, future studies should explore the specific environmental or behavioral mechanisms through which PM10 may influence Lyme disease risk in tick-endemic regions. This could include examining land use patterns, host species distributions, and human outdoor activity levels in high- and low-PM10 counties. Additionally, a temporal study that investigates whether rising or falling PM10 levels are associated with changes in Lyme disease incidence over time could provide causal insight.

Further refinement of the air pollution dataset, such as incorporating seasonal or monthly pollution, might also reveal more nuanced effects not captured in annual averages. Finally, integrating meteorological data (e.g., temperature, humidity, precipitation) and ecological variables (e.g., vegetation cover, deer population density) could help control for other factors that affect tick activity and disease transmission, enhancing the robustness of the model. 

### Conclusion
In both linear and multiple-linear regression models, levels of ozone, sulfur dioxide, nitrogen dioxide, and PM2.5 had no correlation with Lyme disease incidence. Carbon monoxide had a mild negative correlation with Lyme disease rates in the linear regression models due to its connection with environmentally disruptive activities like logging which reduce human exposure to ticks. However, as it was not significant in the multiple linear regression model, carbon monoxide is likely a proxy for other factors. PM10 levels and the incidence of Lyme disease exhibited a significant negative correlation, perhaps because PM10 is an indicator of the damage to tick habitats, which in turn limits tick-human contact. This study provided an understanding of the correlation between Lyme disease rates and air pollution levels, and we hope the findings can be used to inform public health policy and inspire further investigation.

### References
AirNow. (n.d.). *Air Quality Index (AQI) Basics*. AirNow. Retrieved April 23, 2025, from [https://www.airnow.gov/aqi/aqi-basics/](https://www.airnow.gov/aqi/aqi-basics/)  

Andreae, M. O., & Merlet, P. (2001). *Emission of trace gases and aerosols from biomass burning*. *Global Biogeochemical Cycles*, *15*(4), 955–966. [https://doi.org/10.1029/2000gb001382](https://doi.org/10.1029/2000gb001382)  

Beckwith, M., Bates, E., Gillah, A., & Carslaw, N. (2019). *NO2 hotspots: Are we measuring in the right places?* *Atmospheric Environment: X*, *2*, 100025. [https://doi.org/10.1016/j.aeaoa.2019.100025](https://doi.org/10.1016/j.aeaoa.2019.100025)  

Brownstein, J. S., Holford, T. R., & Fish, D. (2005). *Effect of Climate Change on Lyme Disease Risk in North America*. *EcoHealth*, *2*(1), 38–46. [https://doi.org/10.1007/s10393-004-0139-x](https://doi.org/10.1007/s10393-004-0139-x)  

California Air Resources Board. (2015). *Inhalable Particulate Matter and Health (PM2.5 and PM10)*. Ca.gov. [https://ww2.arb.ca.gov/resources/inhalable-particulate-matter-and-health](https://ww2.arb.ca.gov/resources/inhalable-particulate-matter-and-health)  

CDC. (2024, May 15). *Blacklegged Tick Surveillance*. CDC. Retrieved April 23, 2025, from [https://www.cdc.gov/ticks/data-research/facts-stats/blacklegged-tick-surveillance.html](https://www.cdc.gov/ticks/data-research/facts-stats/blacklegged-tick-surveillance.html)  

CDC. (2025a, February 11). *Lyme Disease Surveillance Data*. CDC. Retrieved April 23, 2025, from [https://www.cdc.gov/lyme/data-research/facts-stats/surveillance-data-1.html](https://www.cdc.gov/lyme/data-research/facts-stats/surveillance-data-1.html)  

CDC. (2025b, March 11). *Lyme Disease Case Map*. CDC. Retrieved April 23, 2025, from [https://www.cdc.gov/lyme/data-research/facts-stats/lyme-disease-case-map.html](https://www.cdc.gov/lyme/data-research/facts-stats/lyme-disease-case-map.html)  

Census Bureau. (2025, March). *County Population Totals and Components of Change: 2020-2024*. U.S. Census Bureau. Retrieved April 23, 2025, from [https://www.census.gov/data/tables/time-series/demo/popest/2020s-counties-total.html](https://www.census.gov/data/tables/time-series/demo/popest/2020s-counties-total.html)  

Guo, L., Di, L., Zhang, C., Lin, L., & Di, Y. (2022). *Influence of urban expansion on Lyme disease risk: A case study in the U.S. I-95 Northeastern corridor*. *Cities*, *125*, 103633. [https://doi.org/10.1016/j.cities.2022.103633](https://doi.org/10.1016/j.cities.2022.103633)  

Guo, L., Zhu, N., Guo, Z., Li, G., Chen, C., Sang, N., & Yao, Q. (2012). *Particulate matter (PM10) exposure induces endothelial dysfunction and inflammation in rat brain*. *Journal of Hazardous Materials*, *213-214*, 28–37. [https://doi.org/10.1016/j.jhazmat.2012.01.034](https://doi.org/10.1016/j.jhazmat.2012.01.034)  

Jackson, L. E., Hilborn, E. D., & Thomas, J. C. (2006). *Towards landscape design guidelines for reducing Lyme disease risk*. *International Journal of Epidemiology*, *35*(2), 315–322. [https://doi.org/10.1093/ije/dyi284](https://doi.org/10.1093/ije/dyi284)  

Murray, T. S., & Shapiro, E. D. (2010). *Lyme disease*. *Clinics in Laboratory Medicine*, *30*(1), 311–328. [https://doi.org/10.1016/j.cll.2010.01.003](https://doi.org/10.1016/j.cll.2010.01.003)  

Neidell, M. J. (2008b). *Information, Avoidance Behavior, and Health: The Effect of Ozone on Asthma Hospitalization*. *National Bureau of Economic Research*. [https://www.nber.org/papers/w14209](https://www.nber.org/papers/w14209)  

Pinho-Gomes, A.-C., Roaf, E., Fuller, G., Fowler, D., Lewis, A., ApSimon, H., Noakes, C., Johnstone, P., & Holgate, S. (2023, September). *Air pollution and climate change*. *The Lancet Planetary Health*, *7*(9), e727-e728. [https://doi.org/10.1016/S2542-5196(23)00189-4](https://doi.org/10.1016/S2542-5196(23)00189-4)  

Rose, J. J., Wang, L., Xu, Q., McTiernan, C. F., Shiva, S., Tejero, J., & Gladwin, M. T. (2017). *Carbon monoxide poisoning: Pathogenesis, management, and future directions of therapy*. *American Journal of Respiratory and Critical Care Medicine*, *195*(5), 596–606. [https://doi.org/10.1164/rccm.201606-1275ci](https://doi.org/10.1164/rccm.201606-1275ci)  

Sharareh, N., Behler, R. P., Roome, A. B., Shepherd, J., Garruto, R. M., & Sabounchi, N. S. (2019). *Risk Factors of Lyme Disease: An Intersection of Environmental Ecology and Systems Science*. *Healthcare (Basel, Switzerland)*, *7*(2), 66. [https://doi.org/10.3390/healthcare7020066](https://doi.org/10.3390/healthcare7020066)  

Skar, G. L., Blum, M. A., & Simonsen, K. A. (2024, October 1). *Lyme Disease*. *National Center for Biotechnology Information*. Retrieved April 23, 2025, from [https://www.ncbi.nlm.nih.gov/books/NBK431066/](https://www.ncbi.nlm.nih.gov/books/NBK431066/)  

US EPA. (2015, May 29). *Ground-level Ozone Basics | US EPA*. *US EPA*. [https://www.epa.gov/ground-level-ozone-pollution/ground-level-ozone-basics](https://www.epa.gov/ground-level-ozone-pollution/ground-level-ozone-basics)  

US EPA. (2023, February 16). *Sulfur Dioxide Basics | US EPA*. *US EPA*. [https://www.epa.gov/so2-pollution/sulfur-dioxide-basics](https://www.epa.gov/so2-pollution/sulfur-dioxide-basics)  

US EPA. (2024, November 19). *Pre-Generated Data Files*. *US EPA*. Retrieved April 23, 2025, from [https://aqs.epa.gov/aqsweb/airdata/download_fi les.html](https://aqs.epa.gov/aqsweb/airdata/download_fi les.html)  

Zvereva, E. L., & Kozlov, M. V. (2009). *Responses of terrestrial arthropods to air pollution: a meta-analysis*. *Environmental Science and Pollution Research*, *17*(2), 297–311. [https://doi.org/10.1007/s11356-009-0138-0](https://doi.org/10.1007/s11356-009-0138-0)  
