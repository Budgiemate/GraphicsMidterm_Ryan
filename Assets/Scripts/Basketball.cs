using UnityEngine;

public class Basketball : MonoBehaviour
{
    [SerializeField] private Rigidbody rb;
    [SerializeField] private float speed = 10f;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        rb.linearVelocity = speed * Vector3.forward;
    }

    void OnCollisionEnter(Collision collision)
    {
        Destroy(gameObject);
    }
}
