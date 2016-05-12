# Sync-The-World
Application d'organisation d’événement en C#. Cette application orientée Web Service permet à des utilisateurs d'organiser,participer ou contribuer à des événements (Sorties, Foot, ...).
<br>Elle met en oeuvre une Architecture DAO et expose l'ensemble des fonctionnalités de l'application par web service. La couche web sevice intégre la prise en charge du protocol TCP/IP.
<br>Un client console réaliser en C# est aussi intégré pour montrer l'utilisation des divers fonctionnalités.

<h2>Fonctionnalités</h2>
<li>Opérations CRUD pour les Utilisateurs</li>
<li>Opérations CRUD pour les Evenements</li>
<li>Test de l'existence d'évenements par date ou nom</li>
<li>Récupérer la liste d'évenement disponible entre deux dates</li>
<li>Récupérer la liste d'évenement par status ou par type d'évenement</li>
<li>Supprimer tous les évenements cloturés</li>
<li>Mettre à jour le status des évenements en cours à ouvert</li>
<li>Ajouter des personnes (Utilisateurs) à des évenements ouvert</li>
<li>Récupérer les participants d'un évenement</li>
<li>Récupérer les contributions d'un évenement</li>
<li>Récupérer les contributions d'une personne pour tous les évenements</li>
<li>Supprimer les contribution d'une personne pour tous les évenements ouverts</li>
