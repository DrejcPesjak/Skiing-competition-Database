--
--NIMAM DISCIPLIN!!!!!
--


--Rezultati prve tekme
SELECT TEKMOVALCI.ime, priimek
FROM TEKMOVALCI JOIN CASI ON
	 TEKMOVALCI.id_tekmovalca = CASI.id_tekmovalca
	 JOIN TEKME ON
	 CASI.id_tekme = TEKME.id_tekme
	 JOIN PRIZORISCA ON
	 PRIZORISCA.id_prizorisca = TEKME.id_prizorisca
WHERE CASI.vrsta_casa LIKE ('konec') AND 
	  TEKME.id_tekme = 1
ORDER BY DATEDIFF(millisecond, CASI.lokalni_cas_starta, CASI.cas)

--Ženske tekme leta 2017
SELECT DISTINCT TEKME.* 
FROM TEKME JOIN CASI ON
	 TEKME.id_tekme = CASI.id_tekme
	 JOIN TEKMOVALCI ON
	 TEKMOVALCI.id_tekmovalca = CASI.id_tekmovalca
	 JOIN STEVILKA_NA_TEKMI ON
	 TEKME.id_tekme = STEVILKA_NA_TEKMI.id_tekme
WHERE STEVILKA_NA_TEKMI.tekmovalna_st IS NULL AND
	  TEKMOVALCI.spol LIKE 'Ž' AND 
	  DATEPART(YEAR,CASI.lokalni_cas_starta) = 2017

--Tekme v ZDA
SELECT TEKME.*
FROM TEKME JOIN PRIZORISCA ON
	 TEKME.id_prizorisca = PRIZORISCA.id_prizorisca
WHERE PRIZORISCA.drzava LIKE 'ZDA'

--vrstni red štart 
SELECT TEKMOVALCI.ime, priimek
FROM TEKMOVALCI JOIN STEVILKA_NA_TEKMI ON
	 TEKMOVALCI.id_tekmovalca = STEVILKA_NA_TEKMI.id_tekmovalca
	 JOIN TEKME ON
	 STEVILKA_NA_TEKMI.id_tekme = TEKME.id_tekme
	 JOIN PRIZORISCA ON
	 PRIZORISCA.id_prizorisca = TEKME.id_prizorisca	 
WHERE PRIZORISCA.ime LIKE 'Rogla' AND
	  CASI.lokalni_cas_starta BETWEEN '04/05/2017' AND '05/05/2017'
ORDER BY STEVILKA_NA_TEKMI.tekmovalna_st
