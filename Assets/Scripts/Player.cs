using UnityEngine;

public class Player : MonoBehaviour
{
    [SerializeField] GameObject basketBallPrefab;
    [SerializeField] Transform basketBallPosition;
    
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        //if button then ball spawn and go
        if (Input.GetKeyDown(KeyCode.Space))
        {
            SpawnBasketBall();
        }
    }

    void SpawnBasketBall()
    {
        Instantiate(basketBallPrefab, basketBallPosition);
    }
}
