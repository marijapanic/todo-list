<template>
    <!-- 
Ovo je tipicina Vue komponenta.
Koristimo router za prikaz komponenti, tako da u ulaznom App.vue fajlu samo
definisemo router-view sto znaci da router ima kontrolu nad tim tagom 
naravno ovde mozemo ukljuciti jos neke komponente, pre ili posle routera,
npr. ako zelimo da imamo navbar u okviru cele aplikacije, mozemo to uraditi ovde
tako sto bismo ucitali Navbar kao komponentu i renderovali bismo je pre router-view-a
  -->

    <router-view />
 
</template>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
