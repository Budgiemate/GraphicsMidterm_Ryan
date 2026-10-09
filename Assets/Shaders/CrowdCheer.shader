Shader "Custom/CrowdCheer"
{
    Properties
    {
        _BaseColor ("Base Color", Color) = (1,1,1,1)

        // Q1: What is the purpose of [KeywordEnum(UV0, UV1)] _UVSET?
        _UV1 ("uv1",2D) = "white"{}
        _UV2 ("uv2",2D) = "white" {}
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Geometry" "RenderPipeline"="UniversalRenderPipeline" }
        LOD 200

        Pass
        {
            Name "Unlit"
            Tags { "LightMode"="UniversalForward" }

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            // Q2: What is the purpose of the following #pragma statement?

            #pragma shader_feature_local _UVSET_UV0 _UVSET_UV1

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;

                // Q3: What do uv0 : TEXCOORD0 and uv1 : TEXCOORD1 represent?

                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;

                // Q4: Why does Varyings contain only one float2 uv even
                // though Attributes contains uv0 and uv1?
                bool is1 : BOOL;
                float2 uv : TEXCOORD0;
            };

            TEXTURE2D(_UV1);
            SAMPLER(sampler_UV1);
            
            TEXTURE2D(_UV2);
            SAMPLER(sampler_UV2);

            CBUFFER_START(UnityPerMaterial)
                float4 _BaseColor;
                float4 _BaseMap_ST;
                float4 _UV1_ST;
                float4 _UV2_ST;
            CBUFFER_END

            Varyings vert (Attributes IN)
            {
                Varyings OUT;

                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                
                if (_Time.y % 2 == 0)
                {
                    OUT.uv = TRANSFORM_TEX(IN.uv0, _UV1);
                    OUT.is1 = true;
                }
                else
                {
                    OUT.uv = TRANSFORM_TEX(IN.uv1, _UV2);
                    OUT.is1 = false;
                }
                
                return OUT;
            }

            half4 frag (Varyings IN) : SV_Target
            {
                half4 baseTex;
                // Q8: Which value determines where _BaseMap is sampled
                if (IN.is1)
                {
                    baseTex = SAMPLE_TEXTURE2D(_UV1,sampler_UV1,IN.uv);
                }
                else
                {
                    baseTex = SAMPLE_TEXTURE2D(_UV2,sampler_UV2,IN.uv);
                }
                    
                

                return half4(baseTex.rgb * _BaseColor.rgb, 1.0);
            }

            ENDHLSL
        }
    }

    FallBack Off
}