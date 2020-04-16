<template>
  <!-- click.stop sluzi da spreci Event bubbling, jer je ovaj element ugnjezden u list item,
  bez click.stop pritiskom na edit dugme, promenio bi se status list itema-->
  <span @click.stop>
    <!-- @click ili v-on:click setuje enabled na true, time dobijamo renderovan div ispod koji na sebi ima v-if dirketivu,
    koja ukoliko dobije true vrednost  redneruje komponentu, a ako dobije false onda ne. Postoji v-else dirketiva takodje
    class mt-2 je helper bootstrap klasa da doda margin-top: 2,
    variant je primary, danger, success, info, bootstrap opet-->
    <b-badge @click="enabled = true" class="mt-2" href="#" variant="info" pill>Edit</b-badge>
    <!-- :class ili v-bind:class, sluzi da se u prop ubaci neki dinamicki content,
    npr. :style = '"color": stildugmeta', gde bi stilldugmeta bio neki prop ili data objekat
    v-if uslovno renderovanje-->
    <div :class="type == 'item'? 'item-fix': '' " id="form" v-if="enabled">
      <b-form-input
        autofocus
        @focusout="enabled = false"
        class="mr-1"
        v-model="content"
        size="sm"
        :placeholder="label"
      ></b-form-input>
      <!-- @mousedown.prevent sluzi da spreci promenu fokusa na dugme,
      jer bi se onda aktivirala @focusout metoda i zatvorila modal sa input poljem-->
      <b-button @mousedown.prevent @click="changeTitle" variant="info" size="sm">✔</b-button>
    </div>
  </span>
</template>

<script>
export default {
  // Props, saljemo property-je iz roditelja u dete, ovo je dete komponenta
  props: {
    label: {
      type: String
    },
    type: {
      type: String
    }
  },
  methods: {
    changeTitle() {
      // Obicna validacija
      if (this.content.length < 1) return;
      // Signal roditelju da se desio neki event i prosledjivanje odredjenog payload-a
      // odnosno nekih podataka roditelju
      // VAZNO primetiti da se iz metoda mora sve pristupati preko this, jer Vue sve binduje na this
      this.$emit("changeItem", this.content);
      this.content = "";
      this.enabled = false;
    }
  },
  data() {
    return {
      enabled: false,
      content: ""
    };
  }
};
</script>

<style scoped>
/* scoped atribut znaci da se ovaj stil nece 'prelivati' 
na druge komponente koje mozda imaju istu klasu ili id */
#form {
  width: 150px;
  background-color: rgb(240, 240, 240);
  position: absolute;
  z-index: 2;
  border-radius: 5px;
  padding: 5px;
  display: flex;
}
.item-fix {
  left: 50%;
}

@media (max-width: 576px) {
  .item-fix {
    left: 70%;
  }
}
@media (max-width: 480px) {
  .item-fix {
    left: 50%;
  }
}
</style>
