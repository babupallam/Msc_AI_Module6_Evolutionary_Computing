# Week 1 - Evolutionary Computing 🚀  

## 📌 Overview  
This folder contains **lectures, exercises, MATLAB implementations, and research references** on **Evolutionary Computing**, with a focus on **Genetic Algorithms (GA), Optimization, and Real Genetic Algorithms (RGA).** The material covers **binary and real-coded genetic algorithms**, their operators, and applications in optimization problems.  

---

## 📂 Folder Structure  

```
Week 1 - Evolutionary Computing  
│── 01_Lecture 01 - Optimization  
│── 02_Lecture 02 - Binary Genetic Algorithms (BGA)  
│── 03_Lecture 03 - Real Genetic Algorithms (RGA)  
│── 04_References  
│── 05_Exercises_week_1  
│── README.md  
```

---

## 📚 **Lectures & Notes**  

### 📂 **01_Lecture 01 - Optimization in Evolutionary Computing**  
- **1 - Optimization - Evolutionary Computing.pdf** - Introduction to optimization techniques in evolutionary computing.  
- **MATLAB Scripts for Linear Algebra Operations:**
  - `test1.m` - Basic matrix operations.  
  - `test2.m` - Vector manipulations.  
  - `test3.m` - Solving linear equations.  
- **plotAFun.m** - MATLAB script for function plotting.  
- **Matlab Notes.pdf** - Supplementary notes for MATLAB operations.

📌 **Key Concepts:**  
- **Optimization Techniques in Evolutionary Computing.**  
- **Introduction to MATLAB for Evolutionary Computing.**  
- **Function Optimization and Linear Algebra in MATLAB.**  

---

### 📂 **02_Lecture 02 - Binary Genetic Algorithms (BGA)**  
- **2a - Binary Genetic Algorithms (BGA).pdf** - Introduction to Binary GA and encoding.  
- **2b - BGA Operators & Simulations.pdf** - Explanation of mutation, crossover, and selection operators.  

#### 🔬 **MATLAB Implementation - Binary GA**  
- **Binary GA Code Pack (`Code 1 - Binary GA.zip`)**
  - **Genetic Algorithm Operators:**
    - `DoublePointCrossover.m` - Implements double-point crossover in GA.  
    - `SinglePointCrossover.m` - Implements single-point crossover in GA.  
    - `UniformCrossover.m` - Implements uniform crossover in GA.  
    - `Mutate.m` - Applies mutation operator to individuals.  
    - `MinOne.m` - Fitness function for a binary genetic algorithm.  
  - **Selection & Sorting:**
    - `RouletteWheelSelection.m` - Implements roulette wheel selection.  
    - `SortPopulation.m` - Sorts the population based on fitness.  
  - **Execution & Testing:**
    - `RunGA.m` - Main script to run Binary GA.  
    - `app1.m` - Sample MATLAB application for binary GA.  

📌 **Key Concepts:**  
- **Binary Representation of Genetic Algorithms.**  
- **Genetic Operators - Mutation, Crossover, and Selection.**  
- **Implementation of Binary GA in MATLAB.**  

---

### 📂 **03_Lecture 03 - Real Genetic Algorithms (RGA)**  
- **3a - Real Genetic Algorithms (RGA).pdf** - Real-coded genetic algorithms and their advantages.  
- **2bb - Notes.pdf** - Additional reading materials on real-coded GAs.

📌 **Key Concepts:**  
- **Difference Between Binary and Real Genetic Algorithms.**  
- **Real-Coded Genetic Algorithms (RGA) for Optimization Problems.**  
- **Applications of RGA in Engineering and AI.**  

---

## 📖 **References & Research Papers**  
📂 **04_References** - This section contains relevant research papers and reference materials:  
- **A Novel Genetic Algorithm for Evolvable Hardware.pdf** - GA applications in hardware optimization.  
- **Analysis on 1+1 EA.pdf** - Examination of evolutionary algorithms with single-parent mutation.  
- **Comparing Global And Local Mutation in Bit Strings.pdf** - Mutation strategies in genetic algorithms.  
- **No Free Lunch Theorems for Optimization.pdf** - Theoretical background on optimization limits.  
- **Roulette-wheel selection via stochastic acceptance.pdf** - A study on selection techniques.  
- **Use of Genetic Algorithms as an Innovative Approach.pdf** - Applications of GA in industrial problems.  

📌 **Key Takeaways:**  
- **Theoretical Foundations of Genetic Algorithms.**  
- **Comparison of Selection, Crossover, and Mutation Strategies.**  
- **Mathematical and Computational Perspectives on Evolutionary Computing.**  

---

## 📝 **Weekly Exercises & Reports**  
📂 **05_Exercises_week_1**  

- **EC - Weekly Exercises 1.docx** - Weekly problem set on genetic algorithms.  
- **EC WEEK 1 REPORT P2849288.docx** - Report covering binary GA experiments.  
- **Modified Code Files.rar** - Custom implementations of GA functions.  
- **Solutionary Computing - Weekly Exercises 1.docx** - Additional problem-solving exercises.  

📌 **Key Exercises:**  
- **Implementing Genetic Algorithms in MATLAB.**  
- **Analyzing the Effect of Mutation and Crossover.**  
- **Optimizing Function Performance Using GA.**  

---

## 🏗 **How to Run the MATLAB Code**  

### **Running Binary Genetic Algorithm (BGA)**
1. Extract `Code 1 - Binary GA.zip` in MATLAB working directory.  
2. Open MATLAB and navigate to the extracted folder.  
3. Run the script:  
   ```matlab
   RunGA
   ```
4. Modify mutation rates, crossover strategies, and observe changes in results.

### **Running Real Genetic Algorithm (RGA)**
1. Open MATLAB and load the `.m` files for real-coded GA.  
2. Adjust input parameters and selection mechanisms.  
3. Run experiments and analyze convergence behavior.  

---

## 📢 **Acknowledgment**  
This material is part of the **MSc Artificial Intelligence program at De Montfort University (DMU).**  
Special thanks to **faculty, peers, and researchers** for their contributions.  

🚀 **Optimizing Solutions with Evolutionary Computing!**  
```
