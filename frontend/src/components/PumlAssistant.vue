<template>
  <div class="container">
    <div class="input-area">
      <h2>Enter PUML Syntax</h2>
      <textarea v-model="diagram" required></textarea>
      <button @click="generateDiagram">Generate</button>
    </div>
    <div class="preview-area">
      <h2>Preview</h2>
      <iframe :src="previewSrc" @load="handleLoad"></iframe>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      diagram: '',
      previewSrc: 'about:blank'
    };
  },
  methods: {
    generateDiagram() {
      this.previewSrc = `/generate?diagram=${encodeURIComponent(this.diagram)}`;
    },
    handleLoad(event) {
      const iframe = event.target;
      const fullscreenDiv = this.$refs.fullscreenPreview;
      iframe.contentDocument.body.onclick = () => {
        const img = iframe.contentDocument.body.querySelector('img');
        if (img) {
          fullscreenDiv.querySelector('img').src = img.src;
          fullscreenDiv.style.display = 'flex';
        }
      };
    }
  }
};
</script>

<style>
/* 将CSS样式放在这里 */
/* ... */
</style>