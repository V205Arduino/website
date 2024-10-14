



<script>
  let data = [];
  let loading = true;
  let error = null;


  const apiUrl = 'https://naut-3hjr.onrender.com/feed';

 

  // Function to display time in relative format
  function getTimeAgo(timestamp) {
    const now = new Date().getTime() / 1000;
    const diff = now - timestamp;

    if (diff < 60) {
      return 'just now';
    } else if (diff < 3600) {
      const minutes = Math.floor(diff / 60);
      return `${minutes} minute${minutes > 1 ? 's' : ''} ago`;
    } else if (diff < 86400) {
      const hours = Math.floor(diff / 3600);
      return `${hours} hour${hours > 1 ? 's' : ''} ago`;
    } else if (diff < 604800) {
      const days = Math.floor(diff / 86400);
      return `${days} day${days > 1 ? 's' : ''} ago`;
    } else if (diff < 2592000) {
      const weeks = Math.floor(diff / 604800);
      return `${weeks} week${weeks > 1 ? 's' : ''} ago`;
    } else if (diff < 31536000) {
      const months = Math.floor(diff / 2592000);
      return `${months} month${months > 1 ? 's' : ''} ago`;
    } else {
      const years = Math.floor(diff / 31536000);
      return `${years} year${years > 1 ? 's' : ''} ago`;
    }
  }

  // Fetch data from the API
  async function fetchData() {
    try {
      const response = await fetch(apiUrl);
      console.log(response.json())
      if (!response.ok) {
        throw new Error('Failed to fetch data');
      }
      data = await response.json();
    } catch (err) {
      error = err.message;
      console.error('Error fetching data:', err);
    } finally {
      loading = false;
      console.log('Data loaded!');
    }
  
    // data = [
    //   {
    //     "timestamp": 1728258908,
    //     "type": "book",
    //     "icon": "📖",
    //     "title": "Command and Control",
    //     "author": "Someone",
    //     "stars": 5
    //   },
    //   {
    //     "timestamp": 1728217908,
    //     "type": "book",
    //     "icon": "📖",
    //     "title": "Controlling the Commanders",
    //     "author": "Social Engineer",
    //     "stars": 4
    //   },
    // ];
  }

  // Fetch data when the component is mounted
  fetchData();
</script>


<style>
  .container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px; /* Crucial addition for spacing */
    /* Adjust width as needed */
    
    max-width: 1200px;  /* Constrain the width */
  }

  .bubble {
    display: flex;
    align-items: center;
    padding: 15px;
    background-color: #f2f2f2;
    border-radius: 15px;
    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
    /* Significantly reduced width */
    width: 1000;
    min-width: 900px; /* Prevents bubbles from becoming too small */
    text-align: left;
  }

  .icon {
    font-size: 2em;
    margin-right: 10px; /* Reduced margin */
  }

  .content {
    flex: 1;
  }

  /* Removed the unnecessary pseudo-element */

  /* Improved responsiveness by removing fixed widths and adding media queries */
  @media (max-width: 768px) {
    .bubble {
        width: calc(45% - 20px); /* Adjust as needed for smaller screens */
    }
  }

  @media (max-width: 480px) {
    .bubble {
        width: calc(60% - 20px); /* Adjust as needed for even smaller screens */
        min-width: 150px;
    }
}
</style>


{#if loading}
  <p>Loading... Please wait.</p>
{:else if error}
  <p>Error: {error}</p>
{:else}
  <div class="container">
    <ul>
      {#each data as item}
        <li class="bubble">
          <div class="icon">{item.icon}</div>
          <div class="content">
            <h5><i>{item.title}</i></h5>  <body><i>Posted {getTimeAgo(item.timestamp)}</i></body>
            <p>By {item.author}</p>
            <!--<p>{getStars(item.stars)}</p> <!-- Display star rating -->
            
          </div>
        </li>
      {/each}
    </ul>
  </div>
{/if}