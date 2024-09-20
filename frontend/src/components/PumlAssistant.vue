<template>
  <div class="container">
    <div class="input-area">
      <h2>Enter PUML Syntax</h2>
      <form @submit.prevent="generateDiagram">
        <textarea v-model="diagram" required></textarea>
        <button type="submit">Generate</button>
      </form>
    </div>
    <div class="preview-area">
      <h2>Preview</h2>
      <iframe :src="previewSrc" @load="handleLoad"></iframe>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const diagram = ref('');
const previewSrc = ref('about:blank');

const generateDiagram = async () => {
  try {
    const response = await fetch(`/generate?diagram=${encodeURIComponent(diagram.value)}`);
    const data = await response.text();
    previewSrc.value = `data:text/html;charset=utf-8,${encodeURIComponent(`<pre>${data}</pre>`)}`;
  } catch (error) {
    console.error('Error generating diagram:', error);
  }
};

const handleLoad = (event) => {
  const iframe = event.target;
  iframe.contentDocument.body.onclick = () => {
    const img = iframe.contentDocument.body.querySelector('img');
    if (img) {
      const fullscreenDiv = document.getElementById('fullscreenPreview');
      fullscreenDiv.querySelector('img').src = img.src;
      fullscreenDiv.style.display = 'flex';
    }
  };
};
</script>

<style scoped>
.container {
  display: flex;
  width: 80%;
  margin-top: 20px;
}
.input-area, .preview-area {
  flex: 1;
  margin: 10px;
}
textarea {
  width: 100%;
  height: 300px;
}
iframe {
  width: 100%;
  height: 300px;
  border: 1px solid #ccc;
}
</style>