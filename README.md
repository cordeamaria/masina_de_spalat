# Mașină de spălat rufe
Acest proiect implementează un automat simplu pentru comanda unei mașini de spălat
# Descrierea proiectului
Automatul pentru comanda maşinii de spălat este implementat în **VHDL** şi include moduri manuale şi automate, pornind dintr-o stare inactivă, cu uşa deschisă. În modul manual, utilizatorul poate seta temperatura (30°C, 40°C, 60°C, 90°C), viteza (800, 1000, 1200 rpm), prespălare şi clătire suplimentară. Timpul programului depinde de temperatura aleasă şi de opţiunile selectate.

**Modurile automate sunt:**

* **Spălare rapidă**: 30°C, 1200 rpm, fără prespălare şi clătire suplimentară
* **Cămăşi**: 60°C, 800 rpm, fără prespălare şi clătire suplimentară
* **Culori închise**: 40°C, 1000 rpm, fără prespălare, cu clătire suplimentară
* **Rufe murdare**: 40°C, 1000 rpm, cu prespălare, fără clătire suplimentară
* **Antialergic**: 90°C, 1200 rpm, fără prespălare, cu clătire suplimentară

Fiecare program include spălare principală, clătire şi centrifugare, cu opţiuni suplimentare pentru prespălare sau clătire. Uşa se blochează la începutul programului şi se deschide după un minut de la finalizarea acestuia. Maşina nu porneşte cu uşa deschisă.
