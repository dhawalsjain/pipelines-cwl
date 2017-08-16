{
    "cwlVersion": "draft-3",
    "class": "Workflow",
    "steps": [
        {
            "id": "#cool2mcool",
            "inputs": [
                {
                    "id": "#cool2mcool.outprefix"
                },
                {
                    "id": "#cool2mcool.ncores",
                    "source": "#ncores"
                },
                {
                    "id": "#cool2mcool.input_cool",
                    "source": "#input_cool"
                }
            ],
            "outputs": [
                {
                    "id": "#cool2mcool.output_mcool"
                }
            ],
            "run": "cool2mcool.2.cwl"
        },
        {
            "id": "#add_hic_normvector_to_mcool",
            "inputs": [
                {
                    "id": "#add_hic_normvector_to_mcool.outdir"
                },
                {
                    "id": "#add_hic_normvector_to_mcool.input_mcool",
                    "source": "#cool2mcool.output_mcool"
                },
                {
                    "id": "#add_hic_normvector_to_mcool.input_hic",
                    "source": "#input_hic"
                }
            ],
            "outputs": [
                {
                    "id": "#add_hic_normvector_to_mcool.output_mcool"
                }
            ],
            "run": "add-hic-normvector-to-mcool.5.cwl"
        },
        {
            "id": "#extract_mcool_normvector_for_juicebox",
            "inputs": [
                {
                    "id": "#extract_mcool_normvector_for_juicebox.input_mcool",
                    "source": "#add_hic_normvector_to_mcool.output_mcool"
                },
                {
                    "id": "#extract_mcool_normvector_for_juicebox.outdir"
                },
                {
                    "id": "#extract_mcool_normvector_for_juicebox.output_prefix"
                },
                {
                    "id": "#extract_mcool_normvector_for_juicebox.nres",
                    "source": "#nres"
                }
            ],
            "outputs": [
                {
                    "id": "#extract_mcool_normvector_for_juicebox.output_normvector"
                }
            ],
            "run": "extract-mcool-normvector-for-juicebox.6.cwl"
        }
    ],
    "inputs": [
        {
            "id": "#input_cool",
            "type": [
                "null",
                "File"
            ]
        },
        {
            "id": "#input_hic",
            "type": [
                "null",
                "File"
            ]
        },
        {
            "id": "#ncores",
            "type": [
                "null",
                "int"
            ],
            "default": 4
        },
        {
            "id": "#nres",
            "type": [
                "null",
                "int"
            ],
            "default": 13
        }
    ],
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        }
    ],
    "outputs": [
        {
            "id": "#output_mcool",
            "type": [
                "null",
                "File"
            ],
            "source": "#add_hic_normvector_to_mcool.output_mcool"
        },
        {
            "id": "#output_normvector",
            "type": [
                "null",
                "File"
            ],
            "source": "#extract_mcool_normvector_for_juicebox.output_normvector"
        }
    ]
}