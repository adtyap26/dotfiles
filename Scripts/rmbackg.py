import rembg
import argparse
import os

def remove_background(input_path, output_path):
    with rembg.open(input_path) as img:
        with open(output_path, "wb") as output_file:
            output_file.write(img.read())

def main():
    parser = argparse.ArgumentParser(description="Remove background from an image using rembg.")
    parser.add_argument("input_file", help="Path to the input image file")
    parser.add_argument("output_file", help="Path to save the output image (background removed)")
    
    args = parser.parse_args()

    if not os.path.exists(args.input_file):
        print("Error: Input file does not exist.")
        return

    remove_background(args.input_file, args.output_file)
    print("Background removed and saved to", args.output_file)

if __name__ == "__main__":
    main()

