<template>
  <div>
    <b-list-group-item
      style="cursor: pointer;"
      @click="changeStatus(item)"
      v-for="(item, id) in list.itemi"
      :key="id"
      id="list-item"
      class="d-flex justify-content-between align-items-center"
      :variant="(item.status == '0')?'info':'success'"
    >
      <div
        :style="(item.status == '0')?'textDecoration: none;':'textDecoration: line-through'"
      >{{id + 1}}. {{item.content}}</div>
      <div>
        <Dropdown
          type="item"
          id="change-item"
          @changeItem="changeItem(item, ...arguments)"
          label="Content"
        />
        <b-badge @click.stop="deleteItem(item)" href="#" variant="danger" pill>X</b-badge>
      </div>
    </b-list-group-item>

    <b-input-group class="mt-3" style="z-index: 0" prepend="New item">
      <b-form-input v-model="newItem"></b-form-input>
      <b-input-group-append>
        <b-button @click="addItem(list)" size="sm" text="Add" variant="success">Add</b-button>
      </b-input-group-append>
    </b-input-group>
  </div>
</template>

<script>
import Dropdown from "@/components/Dropdown.vue";
export default {
  components: {
    Dropdown
  },
  props: {
    list: {
      type: Object
    }
  },
  data() {
    return {
      newItem: ""
    };
  },
  methods: {
    async changeItem(item, content) {
      const reqBody = {
        content: content,
        status: item.status,
        list_id: item.list_id
      };
      await this.$http.put(
        `${this.$store.state.baseUrl}/itemi/${item.id}`,
        reqBody
      );
      this.$emit("update-lists");
    },
    async deleteItem(item) {
      await this.$http.delete(`${this.$store.state.baseUrl}/itemi/${item.id}`);
      this.$emit("update-lists");
    },
    async changeStatus(item) {
      const resBody = {
        status: item.status == "0" ? "1" : "0",
        content: item.content,
        list_id: item.list_id
      };
      await this.$http.put(
        `${this.$store.state.baseUrl}/itemi/${item.id}`,
        resBody
      );
      this.$emit("update-lists");
    },
    async addItem(list) {
      if (this.newItem.length < 1) return;
      const resBody = { content: this.newItem, status: 0, list_id: list.id };
      await this.$http.post(`${this.$store.state.baseUrl}/itemi`, resBody);
      this.newItem = "";
      this.$emit("update-lists");
    }
  }
};
</script>

<style scoped>
</style>
