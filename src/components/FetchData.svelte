<script>
    let data = [];
    let loading = true;
    let error = null;
  
    // Specify your API endpoint here
    const apiUrl = 'https://scrapbook.hackclub.com/api/users';
  
    // Fetch data from the API
    async function fetchData() {
      try {
        const response = await fetch(apiUrl);
        if (!response.ok) {
          throw new Error('Failed to fetch data');
        }
        data = await response.json();
      } catch (err) {
        error = err.message;
      } finally {
        loading = false;
      }
    }
  
    // Fetch data when the component is mounted
    fetchData();
  </script>
  
  {#if loading}
    <p>Loading...</p>
  {:else if error}
    <p>Error: {error}</p>
  {:else}
    <ul>
      {#each data as item}
        <li>{item.title}</li>
      {/each}
    </ul>
  {/if}