using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Scriptcito : MonoBehaviour
{

    public Transform luz, luz2;
    public Renderer renderer;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        //transform.Rotate(0, 30 * Time.deltaTime, 0);
        renderer.material.SetVector("_Lucecita", new Vector4(
                luz.transform.position.x,
                luz.transform.position.y,
                luz.transform.position.z,
                1
            ));
        renderer.material.SetVector("_Lucecita2", new Vector4(
                luz2.transform.position.x,
                luz2.transform.position.y,
                luz2.transform.position.z,
                1
            ));
    }
}
