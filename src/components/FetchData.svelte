<script>
    let data = [];
    let loading = true;
    let error = null;
  
    // Specify your API endpoint here
    const apiUrl ='https://scrapbook.hackclub.com/api/users'; //'https://localhost:3000/API'//
    console.log("doing stuff")
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
        console.log("aaa err")
        console.log(error)
      } finally {
        loading = false;
        console.log("loaded!")
        console.log(data)
      }
    }

  
    // Fetch data when the component is mounted
    fetchData();
  </script>
  
  {#if loading}
    <p>Loading... <br>Please wait as this can sadly take up to 15 seconds on average.</p>
  {:else if error}
    <p>Error: {error}</p>
  {:else}
    <ul>
      {#each data as item}
        <li>{item.title}</li>

      {/each}
    </ul>
  {/if}